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

variable "virtual_server" {
  type        = map
  description = "BigIP Virtual_Server 設定值"
  default = {
    pool1 = {
      description = ""
      destination = ""
      port        = 80
    }
    pool2 = {
      description = ""
      destination = ""
      port        = 8080
  }
}  
