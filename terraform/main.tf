
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Ressources kubernetes pour le déploiement des containers.
resource "kubernetes_deployment" "stevy-container-deploiement" {
  metadata {
    name      = "stevy"
    namespace = "rashid"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "stevy"
      }
    }

    template {
      metadata {
        labels = {
          app = "stevy"
        }
      }

      spec {
        # node_selector = {
        #   node_name = "master"
        # }
        container {
          image = "smarlino/marwaney"
          name  = "sm-container"
          port {
            container_port = 22
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 0
      }
    }
  }
}

# Ressource NodePort ssh
resource "kubernetes_service" "ssh-service" {
  metadata {
    name      = "node-ssh"
    namespace = "rashid"
  }

  spec {
    selector = {
      app = "stevy"
    }

    type = "NodePort"

    port {
      name        = "ssh"
      port        = 22
      target_port = 22
      protocol    = "TCP"
    }
  }
}
