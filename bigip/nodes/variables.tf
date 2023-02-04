variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "nodes" {
  type        = map(any)
  description = "BigIP F5 Nodes"
  default = {
    key1 = {
      name        = "node1"
      address     = "192.168.0.1"
      description = ""
    }
    key2 = {
      name        = "node2"
      address     = "192.168.0.2"
      description = ""
    }
  }
}
