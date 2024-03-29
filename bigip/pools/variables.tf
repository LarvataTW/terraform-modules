variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "pools" {
  type        = map(any)
  description = "BigIP F5 Pools"
  default = {
    key1 = {
      name        = "pool_http"
      mode        = "round-robin"
      port        = 80
      description = ""
    }
    key2 = {
      name        = "pool_https"
      mode        = "round-robin"
      port        = 443
      description = ""
    }
  }
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
