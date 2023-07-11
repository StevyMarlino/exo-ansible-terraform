terraform {
  backend "kubernetes" {
    config_path = "~/.kube/config"
    namespace = "rashid"
  }
}
