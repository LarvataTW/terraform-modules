variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "pools" {
  type        = map(any)
  description = "BigIP F5 Pools"
  default = {
    pool_key1 = {
      name        = "pool_http"
      mode        = "round-robin"
      port        = 80
      description = ""
    }
    pool_key2 = {
      name        = "pool_https"
      mode        = "round-robin"
      port        = 443
      description = ""
    }
  }
}

variable "virtual_servers" {
  type        = map(any)
  description = "BigIP F5 Virtual Servers"
  default = {
    key1 = {
      name         = "vs1"
      destination  = "public.ipv4.or.ipv6"
      description  = ""
      default_pool = "pool_key1"
    }
    key2 = {
      name         = "vs2"
      destination  = "public.ipv4.or.ipv6"
      description  = ""
      default_pool = "pool_key2"
    }
  }
}
