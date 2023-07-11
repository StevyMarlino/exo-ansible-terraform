terraform {
  backend "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "config-backend-stevy"
    namespace = "worketyamo"
    prefix = "stevy"
  }
}
