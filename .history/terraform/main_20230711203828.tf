# Déclaration du fournisseur (ex: Kubernetes)
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "<nom-du-contexte-kubernetes>"
}

# Déclaration des ressources Kubernetes
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
          image = "smarlino-exo/marwaney"
          name  = "container-1"
          ports {
            container_port = 22
          }
        }
      }
    }
  }
}

# NodePort ssh
resource "kubernetes_service" "example" {
  metadata {
    name = "node-ssh"
  }

  spec {
    selector = {
      app = "my-pods"
    }

    type = "NodePort"

    port {
      name       = "ssh"
      port       = 22
      target_port = 22
      protocol   = "TCP"
    }
  }
}
