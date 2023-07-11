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
          node-role.kubernetes.io / master = "true"
        }
        container {
          image = "smarlino-exo/marwaney"
          count = length(var.pod_definition)
          name  = var.pod_definition[count.index].pod_name
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
