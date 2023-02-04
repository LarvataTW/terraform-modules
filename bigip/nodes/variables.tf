variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "nodes" {
  type        = map(any)
  description = "Node Description"
  default = {
    node1 = {
      address     = "192.168.0.1"
      description = ""
    }
    node2 = {
      address     = "192.168.0.2"
      description = ""
    }
  }
}
