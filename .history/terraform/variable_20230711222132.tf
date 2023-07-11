variable "pod_definition" {
  type = map(string)

  default = {
    pod_name_1 = "my-pod-1"
    pod_name_2 = "my-pod-2"
    pod_name_3 = "my-pod-3"
  }
}
