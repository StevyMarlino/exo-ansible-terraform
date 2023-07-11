variable "pod_definition" {
  type = list(object({
    pod_name string
    # Autres attributs nécessaires pour chaque élément du tableau
  }))

  default = [
    {
      pod_name = "-1"
      # Autres attributs pour le premier élément
    },
    {
      pod_name = "-2"
      # Autres attributs pour le deuxième élément
    },
    {
      pod_name = "-3"
      # Autres attributs pour le troisième élément
    },
  ]
}
