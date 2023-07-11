# Déclaration du fournisseur (ex: Kubernetes)
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Ressources kubernetes
resource "kubernetes_deployment" "stevy_container_deploiement" {
  metadata {
    name = ""
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = ""
      }
    }

    template {
      metadata {
        labels = {
          app = ""
        }
      }

      spec {
        node_selector = {
          node-role.kubernetes.io / master = "master"
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

# NodePort ssh
resource "kubernetes_service" "ssh_service" {
  metadata {
    name = "node-ssh"
  }

  spec {
    selector = {
      app = ""
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
