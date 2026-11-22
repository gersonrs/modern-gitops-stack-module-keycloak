#######################
## Standard variables
#######################

variable "cluster_name" {
  description = "Name given to the cluster. Value used for the ingress' URL of the application."
  type        = string
}

variable "base_domain" {
  description = "Base domain of the cluster. Value used for the ingress' URL of the application."
  type        = string
}

variable "subdomain" {
  description = "Subdomain of the cluster. Value used for the ingress' URL of the application."
  type        = string
  default     = "apps"
  nullable    = false
}

variable "cluster_issuer" {
  description = "SSL certificate issuer to use. In this module it is used to conditionally add extra arguments to the OIDC configuration."
  type        = string
  default     = "selfsigned-issuer"
}

variable "dependency_ids" {
  description = "IDs of the other modules on which this module depends on."
  type        = map(string)
  default     = {}
}

#######################
## Module variables
#######################

variable "oidc_redirect_uris" {
  description = "List of URIs where the authentication server is allowed to return during the authentication flow."
  type        = list(string)
  default = [
    "*"
  ]
}

variable "user_map" {
  description = "List of users to be added to the Modern GitOps Stack Realm. Note that all fields are mandatory."
  type = map(object({
    username   = string
    email      = string
    first_name = string
    last_name  = string
  }))
  default = {
    modern-gitopsadmin = {
      username   = "moderngitopsadmin"
      email      = "moderngitopsadmin@modern-gitops-stack.io"
      first_name = "Administrator"
      last_name  = "Modern GitOps Stack"
    }
  }
}

variable "corporate_identity_provider" {
  description = <<-EOT
    Configuration for Identity Brokering with an external corporate OIDC provider
    (e.g. a corporate Keycloak/SSO). When enabled, this realm delegates
    authentication to the external provider while remaining the source of truth
    for authorization (groups/roles), which are assigned locally to the "shadow"
    user Keycloak creates on first login.

    Obtain `authorization_url`, `token_url`, `user_info_url`, `jwks_url` and
    `issuer` from the external provider's OpenID discovery document, usually at
    `<issuer>/.well-known/openid-configuration`. `client_id`/`client_secret` are
    issued by the external provider's administrators for a client registered to
    redirect to this Keycloak.
  EOT
  type = object({
    enabled           = optional(bool, false)
    alias             = optional(string, "corporate-sso")
    display_name      = optional(string, "Corporate SSO")
    authorization_url = optional(string, "")
    token_url         = optional(string, "")
    user_info_url     = optional(string, "")
    jwks_url          = optional(string, "")
    logout_url        = optional(string, "")
    issuer            = optional(string, "")
    client_id         = optional(string, "")
    client_secret     = optional(string, "")
    default_scopes    = optional(string, "openid profile email")
    sync_mode         = optional(string, "IMPORT")
    trust_email       = optional(bool, true)
  })
  default   = {}
  sensitive = true
}

variable "session_settings" {
  description = <<-EOT
    Realm session and token lifetimes. Defaults keep users signed in for a
    working day instead of the Keycloak defaults, which expire an idle session
    after 30 minutes and force a new login.

    - `sso_session_idle_timeout`: how long a session may stay idle before it is
      invalidated. This is what logs the user out after a coffee break.
    - `sso_session_max_lifespan`: absolute session lifetime regardless of
      activity.
    - `access_token_lifespan`: how long an access token stays valid before the
      client must refresh it. Kept at the Keycloak default so the shorter
      session does not widen the token exposure window.

    Values use Keycloak duration syntax, e.g. "30m", "12h", "1d".
  EOT
  type = object({
    sso_session_idle_timeout = optional(string, "12h")
    sso_session_max_lifespan = optional(string, "24h")
    access_token_lifespan    = optional(string, "5m")
  })
  default = {}
}
