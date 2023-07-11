
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Ressources kubernetes pour le déploiement des containers.
resource "kubernetes_deployment" "stevy_container_deploiement" {
  metadata {
    name = "stevy"
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
        node_selector = {
          "node-role.kubernetes.io / master" = "true"
        }
    dynamic "container" {
          for_each = var.pod_definition
          content {
            image = "smarlino-exo/marwaney"
            name  = container.value.pod_name
            
            dynamic "port" {
              for_each = container.value.ports
              content {
                container_port = port.value
              }
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
resource "kubernetes_service" "ssh_service" {
  metadata {
    name = "node-ssh"
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
