variable "pod_definition" {
  type = map(string)

  default = {
    pod_name = "sm-container-1"
    pod_name = "my-pod-2"
    pod_name = "my-pod-3"
  }
}
