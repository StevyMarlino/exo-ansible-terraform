variable "pod_definition" {
  type = list(object({
    pod_name = string
    ports = int
  }))

  default = [
    {
      pod_name = "sm-container-1"
      ports    = 22
    },
    {
      pod_name = "sm-container-2"
      ports    = 22
    },
    {
      pod_name = "sm-container-3"
      ports    = 22
    },
  ]
}
