# Déclaration du fournisseur (ex: Kubernetes)
provider "kubernetes" {
  config_path    = "~/.kube/config"
}

# Ressources kubernetes
resource "kubernetes_deployment" "example" {
  metadata {
    name = "my-service-share"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "my-service-share"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-service-share"
        }
      }

      spec {
        container {
          image = "smarlino-exo/marwaney"
count = length(var.pod_definition) 
 name      = var.pod_definition[count.index].pod_name
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
      app = "my-service-share"
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
