terraform {
  backend "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "config-backend-stevy"
    namespace = "worketyamo"
    # secret_name = "<nom-du-secret>"
    # secret_key = "<cle-du-secret>"
    prefix = "stevy"
  }
}
