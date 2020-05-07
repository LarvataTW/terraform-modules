variable "as3_action" {
  type        = string
  description = "BigIP AS3 執行動作：deploy, dry-run, redeploy, retrieve, remove"
  default     = "deploy"
}

variable "as3_id" {
  type        = string
  description = "BigIP AS3 ID，唯一識別或使用 UUID"
  default     = "unique-declaration-name-or-uuid"
}

variable "as3_label" {
  type        = string
  description = "BigIP AS3 標籤"
  default     = "terraform"
}

variable "as3_remark" {
  type        = string
  description = "BigIP AS3 描述"
  default     = "使用 Terraform 呼叫 F5 Application Services 3 Extension 產出的設定"
}

variable "as3_application_name" {
  type        = string
  description = "BigIP AS3 設定名稱"
  default     = null
}

variable "as3_application_template" {
  type        = string
  description = "BigIP AS3 設定樣板：http, https, tcp, udp, l4, generic, shared"
  default     = "http"
}

variable "as3_service_class" {
  type        = string
  description = "BigIP AS3 服務類別：Service_HTTP, Service_HTTPS, Service_TCP, Service_UDP, Service_L4, Service_Generic"
  default     = "Service_HTTP"
}

variable "tenant_name" {
  type        = string
  description = "BigIP Partition 名稱"
}

variable "virtual_server_addresses" {
  type        = list
  description = "BigIP Virtual Server 位址"
  default     = []
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
  description = "BigIP Pool 負載模式：predictive-node, round-robin"
  default     = "round-robin"
}

variable "node_port" {
  type        = number
  description = "BigIP Pool Member 的服務埠號"
  default     = 80
}

variable "node_addresses" {
  type        = list
  description = "BigIP Pool Member 的 IP"
  default     = []
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
