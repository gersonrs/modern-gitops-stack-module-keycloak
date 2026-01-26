locals {
  helm_values = [{
    keycloak = {
      name     = "keycloak"
      replicas = var.replicas
      database = var.database != null ? {
        create         = false
        host           = var.database.host
        existingSecret = "keycloak-db-secret"
        } : {
        # TODO doc that the fallback map (experimental ephemeral postgresql server) should never be used in production.
        create         = true
        host           = "keycloak-postgres-db"
        existingSecret = "keycloak-db-secret"
      }
      serviceMonitor = {
        enabled = var.enable_service_monitor
      }
      ingress = {
        enabled = true
        annotations = {
          "cert-manager.io/cluster-issuer"                   = "${var.cluster_issuer}"
          "traefik.ingress.kubernetes.io/router.entrypoints" = "websecure"
          "traefik.ingress.kubernetes.io/router.tls"         = "true"
        }
        host = "keycloak.${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}." : ""}${var.base_domain}"
        path = "/"
        tls = {
          secretName = "keycloak-tls-secret"
          host       = "keycloak.${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}." : ""}${var.base_domain}"
        }
      }
    }
  }]
}
