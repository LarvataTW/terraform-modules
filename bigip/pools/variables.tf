variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "pools" {
  type        = map(any)
  description = "Pool Description"
  default = {
    my_pool_http = {
      name = "my_pool_http"
      mode = "round-robin"
      port = 80
    }
    my_pool_https = {
      name = "my_pool_https"
      mode = "round-robin"
      port = 443
    }
  }
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
