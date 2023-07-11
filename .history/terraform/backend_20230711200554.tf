terraform {
  backend "kubernetes" {
    config = {
      load_config_file = "false"
      host             = "https://<adresse-du-cluster-kubernetes>"
      username         = "<utilisateur-du-cluster>"
      password         = "<mot-de-passe-du-cluster>"
      namespace        = "<namespace-pour-stocker-l-etat>"
      secret_namespace = "<namespace-pour-stocker-les-secrets>"
      secret_name      = "<nom-du-secret>"
      secret_key       = "<cle-du-secret>"
      prefix           = "stevy"
    }
  }
}
