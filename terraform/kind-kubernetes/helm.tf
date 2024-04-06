resource "helm_release" "nginx" {
  count      = var.install_nginx ? 1 : 0
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace  = "default"
  version    = "16.0.1"

  set {
    name  = "replicaCount"
    value = "1"
  }

}
