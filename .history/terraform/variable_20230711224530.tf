variable "pod_definition" {
  type = list(object({
    pod_name = string
  }))

  default = [
    {
      pod_name = "sm-container-1"
      ports = 
    },
    {
      pod_name = "sm-container-2"
    },
    {
      pod_name = "sm-container-3"
    },
  ]
}
