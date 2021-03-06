variable "tenant_name" {
  type        = string
  description = "BigIP F5 Partition"
  default     = "Common"
}

variable "pool_name" {
  type        = string
  description = "BigIP Pool 名稱"
}

variable "pool_description" {
  type        = string
  description = "BigIP Pool 描述"
}

variable "pool_mode" {
  type        = string
  description = "BigIP Pool 負載模式"
  default     = "round-robin"
}

variable "nodes" {
  type        = map
  description = "BigIP Node 設定值"
  default = {
    node1 = {
      address     = "192.168.0.1"
      description = ""
      port        = 80
    }
    node2 = {
      address     = "192.168.0.2"
      description = ""
      port        = 8080
    }
  }
}
