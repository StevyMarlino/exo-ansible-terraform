terraform {
  backend "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "rashid@kubernetes"
    namespace = "worketyamo"
  }
}
