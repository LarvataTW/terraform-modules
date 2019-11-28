variable "zone" {
  type        = "string"
  description = "DNS Zone 域名"
  default     = "devops.internal"
}

variable "records" {
  type        = "map"
  description = "DNS 記錄對應表"
  default = {
    foo = "1.2.3.4"
    bar = "1.2.3.4"
  }
}
