# Déclaration du fournisseur (ex: Kubernetes)
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Ressources kubernetes
resource "kubernetes_deployment" "example" {
  metadata {
    name = "my-pods"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "my-pods"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-pods"
        }
      }

      spec {
        container {
          image = "smarlino-exo/marwaney:v1"
          name  = "container-1"
          ports {
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

# NodePort ssh
resource "kubernetes_service" "ssh_service" {
  metadata {
    name = "node-ssh"
  }

  spec {
    selector = {
      app = "my-service-share"
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
