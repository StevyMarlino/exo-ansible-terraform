variable "pod_definition" {
  type = list(object({
    pod_name = string
    # Autres attributs nécessaires pour chaque élément du tableau
  }))

  default = [
    {
      pod_name = "sm-container-1"
    },
    {
      pod_name = "sm-container-2"
    },
    {
      pod_name = "sm-container-3"
    },
  ]
}