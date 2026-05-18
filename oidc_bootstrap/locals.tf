locals {
  url_scheme = var.cluster_issuer == "letsencrypt-prod" ? "https" : "http"
  oidc = {
    issuer_url    = format("%s://keycloak.%s/realms/modern-gitops-stack", local.url_scheme, trimprefix("${var.subdomain}.${var.base_domain}", "."))
    oauth_url     = format("%s://keycloak.%s/realms/modern-gitops-stack/protocol/openid-connect/auth", local.url_scheme, trimprefix("${var.subdomain}.${var.base_domain}", "."))
    token_url     = format("%s://keycloak.%s/realms/modern-gitops-stack/protocol/openid-connect/token", local.url_scheme, trimprefix("${var.subdomain}.${var.base_domain}", "."))
    api_url       = format("%s://keycloak.%s/realms/modern-gitops-stack/protocol/openid-connect/userinfo", local.url_scheme, trimprefix("${var.subdomain}.${var.base_domain}", "."))
    client_id     = "modern-gitops-stack-applications"
    client_secret = resource.random_password.client_secret.result
    oauth2_proxy_extra_args = var.cluster_issuer != "letsencrypt-prod" ? [
      "--insecure-oidc-skip-issuer-verification=true",
      "--ssl-insecure-skip-verify=true",
    ] : []
  }
}
