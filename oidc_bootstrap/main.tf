resource "null_resource" "dependencies" {
  triggers = var.dependency_ids
}

resource "keycloak_realm" "modern_gitops_stack" {
  realm                       = "modern-gitops-stack"
  display_name                = "Modern GitOps Stack"
  display_name_html           = "<img width='200px' src='https://raw.githubusercontent.com/GersonRS/credit-risk-analysis-with-machine-learning/main/.github/assets/images/logo.png' alt='Modern GitOps Stack Logo'/>"
  login_with_email_allowed    = true
  login_theme                 = "modern-gitops"
  default_signature_algorithm = "RS256"
  access_code_lifespan        = "1h"
  ssl_required                = var.cluster_issuer == "letsencrypt-prod" ? "external" : "none"
  password_policy             = "upperCase(1) and length(8) and forceExpiredPasswordChange(365) and notUsername"
  attributes = {
    terraform = "true"
  }

  depends_on = [
    resource.null_resource.dependencies
  ]
}

resource "random_password" "client_secret" {
  length  = 32
  special = false
}

# Identity Brokering: lets users authenticate via an external corporate SSO
# (e.g. Magalu's Keycloak) while this Keycloak remains the source of truth for
# authorization (groups/roles) used by the applications in this stack. On
# first login, Keycloak creates a local "shadow" user from the external IdP's
# claims; groups/roles are then assigned locally (manually or via mappers).
resource "keycloak_oidc_identity_provider" "corporate_sso" {
  count = var.corporate_identity_provider.enabled ? 1 : 0

  realm             = resource.keycloak_realm.modern_gitops_stack.id
  alias             = var.corporate_identity_provider.alias
  display_name      = var.corporate_identity_provider.display_name
  authorization_url = var.corporate_identity_provider.authorization_url
  token_url         = var.corporate_identity_provider.token_url
  user_info_url     = var.corporate_identity_provider.user_info_url
  jwks_url          = var.corporate_identity_provider.jwks_url
  logout_url        = var.corporate_identity_provider.logout_url
  issuer            = var.corporate_identity_provider.issuer
  client_id         = var.corporate_identity_provider.client_id
  client_secret     = var.corporate_identity_provider.client_secret
  default_scopes    = var.corporate_identity_provider.default_scopes
  sync_mode         = var.corporate_identity_provider.sync_mode
  trust_email       = var.corporate_identity_provider.trust_email
  store_token       = true

  extra_config = {
    "clientAuthMethod" = "client_secret_post"
  }

  depends_on = [
    resource.keycloak_realm.modern_gitops_stack
  ]
}

# Automatically assigns every user authenticating via the corporate SSO to the
# least-privileged local group on first login (since anyone who successfully
# authenticates through this specific broker is, by definition, a Magalu
# employee). From there, admins can promote users to more privileged groups
# (editors/admins/etc.) manually as needed.
resource "keycloak_custom_identity_provider_mapper" "corporate_sso_default_group" {
  count = var.corporate_identity_provider.enabled ? 1 : 0

  realm                    = resource.keycloak_realm.modern_gitops_stack.id
  name                     = "default-group-assignment"
  identity_provider_alias  = resource.keycloak_oidc_identity_provider.corporate_sso[0].alias
  identity_provider_mapper = "%s-hardcoded-group-idp-mapper"

  extra_config = {
    syncMode = "INHERIT"
    group    = "/${resource.keycloak_group.modern_gitops_stack_viewers.name}"
  }
}

resource "keycloak_openid_client" "modern_gitops_stack" {
  realm_id                     = resource.keycloak_realm.modern_gitops_stack.id
  name                         = "Modern GitOps Stack Applications"
  client_id                    = local.oidc.client_id
  client_secret                = resource.random_password.client_secret.result
  access_type                  = "CONFIDENTIAL"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris          = var.oidc_redirect_uris
}

resource "keycloak_openid_audience_protocol_mapper" "modern_gitops_stack" {
  realm_id  = resource.keycloak_realm.modern_gitops_stack.id
  client_id = resource.keycloak_openid_client.modern_gitops_stack.id
  name      = "audience"

  included_client_audience = local.oidc.client_id
}

resource "keycloak_openid_client_scope" "modern_gitops_stack_groups" {
  realm_id               = resource.keycloak_realm.modern_gitops_stack.id
  name                   = "groups"
  description            = "OpenID Connect scope to map a user's group memberships to a claim"
  include_in_token_scope = true
}

resource "keycloak_openid_client_scope" "modern_gitops_stack_minio_policy" {
  realm_id               = resource.keycloak_realm.modern_gitops_stack.id
  name                   = "minio-policy"
  description            = "OpenID Connect scope to map MinIO access policy to a claim"
  include_in_token_scope = true
}

resource "keycloak_openid_client_scope" "modern_gitops_stack_username" {
  realm_id               = resource.keycloak_realm.modern_gitops_stack.id
  name                   = "username"
  description            = "OpenID Connect built-in scope: username"
  include_in_token_scope = true
}

resource "keycloak_openid_group_membership_protocol_mapper" "modern_gitops_stack_groups" {
  realm_id        = resource.keycloak_realm.modern_gitops_stack.id
  client_scope_id = resource.keycloak_openid_client_scope.modern_gitops_stack_groups.id
  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}

resource "keycloak_openid_user_attribute_protocol_mapper" "modern_gitops_stack_minio_policy" {
  realm_id             = resource.keycloak_realm.modern_gitops_stack.id
  client_scope_id      = resource.keycloak_openid_client_scope.modern_gitops_stack_minio_policy.id
  name                 = "minio-policy"
  user_attribute       = "policy"
  claim_name           = "policy"
  multivalued          = true
  aggregate_attributes = true
  add_to_id_token      = true
  claim_value_type     = "String"
}
resource "keycloak_openid_user_attribute_protocol_mapper" "modern_gitops_stack_username" {
  realm_id             = resource.keycloak_realm.modern_gitops_stack.id
  client_scope_id      = resource.keycloak_openid_client_scope.modern_gitops_stack_username.id
  name                 = "username"
  user_attribute       = "username"
  claim_name           = "username"
  multivalued          = false
  aggregate_attributes = false
  add_to_id_token      = true
  claim_value_type     = "String"
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = resource.keycloak_realm.modern_gitops_stack.id
  client_id = resource.keycloak_openid_client.modern_gitops_stack.id
  default_scopes = [
    "profile",
    "email",
    "roles",
    "username",
    resource.keycloak_openid_client_scope.modern_gitops_stack_groups.name,
    resource.keycloak_openid_client_scope.modern_gitops_stack_minio_policy.name,
  ]
}

resource "keycloak_group" "modern_gitops_stack_admins" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-admins"
  attributes = {
    "terraform" = "true"
    "policy"    = "consoleAdmin##readwrite##diagnostics"
  }
}

resource "keycloak_group" "modern_gitops_stack_viewers" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-viewers"
  attributes = {
    "terraform" = "true"
    "policy"    = "readonly"
  }
}

resource "keycloak_group" "modern_gitops_stack_editors" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-editors"
  attributes = {
    "terraform" = "true"
    "policy"    = "consoleAdmin##readwrite"
  }
}

resource "keycloak_group" "modern_gitops_stack_data_engineers" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-data-engineers"
  attributes = {
    "terraform"   = "true"
    "policy"      = "consoleAdmin##readwrite"
    "description" = "Data Engineers - Access to data pipelines, ETL jobs, Airflow, NiFi, Kafka"
  }
}

resource "keycloak_group" "modern_gitops_stack_data_scientists" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-data-scientists"
  attributes = {
    "terraform"   = "true"
    "policy"      = "readwrite"
    "description" = "Data Scientists - Access to JupyterHub, MLflow experiments, notebooks"
  }
}

resource "keycloak_group" "modern_gitops_stack_ml_engineers" {
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  name     = "modern-gitops-stack-ml-engineers"
  attributes = {
    "terraform"   = "true"
    "policy"      = "readwrite##diagnostics"
    "description" = "ML Engineers - Access to MLflow models, model registry, deployments, monitoring"
  }
}

resource "random_password" "modern_gitops_stack_users" {
  for_each = var.user_map

  length  = 32
  special = false
}

resource "keycloak_user" "modern_gitops_stack_users" {
  for_each = var.user_map

  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  username = each.value.username
  initial_password {
    value = resource.random_password.modern_gitops_stack_users[each.key].result
  }
  first_name     = each.value.first_name
  last_name      = each.value.last_name
  email          = each.value.email
  email_verified = true
}

resource "keycloak_user_groups" "modern_gitops_stack_admins" {
  for_each = var.user_map

  user_id  = resource.keycloak_user.modern_gitops_stack_users[each.key].id
  realm_id = resource.keycloak_realm.modern_gitops_stack.id
  group_ids = [
    resource.keycloak_group.modern_gitops_stack_admins.id
  ]
}

resource "null_resource" "this" {
  depends_on = [
    resource.keycloak_realm.modern_gitops_stack,
    resource.keycloak_group.modern_gitops_stack_admins,
    resource.keycloak_group.modern_gitops_stack_viewers,
    resource.keycloak_group.modern_gitops_stack_editors,
    resource.keycloak_group.modern_gitops_stack_data_engineers,
    resource.keycloak_group.modern_gitops_stack_data_scientists,
    resource.keycloak_group.modern_gitops_stack_ml_engineers,
    resource.keycloak_user.modern_gitops_stack_users,
    resource.keycloak_user_groups.modern_gitops_stack_admins,
    resource.keycloak_openid_client_default_scopes.client_default_scopes
  ]
}
