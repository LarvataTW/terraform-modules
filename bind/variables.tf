variable "zone" {
  type        = string
  description = "DNS Zone 域名"
  default     = "internal.domain"
}

variable "ttl" {
  type        = number
  description = "Time To Live"
  default     = 600
}

variable "a_records" {
  type        = map
  description = "DNS A 記錄對應表"
  default = {
    foo = { ip = ["1.2.3.4", ] }
    bar = { ip = ["2.2.2.2", "3.3.3.3", ] }
  }
}

variable "aaaa_records" {
  type        = map
  description = "DNS AAAA 記錄對應表"
  default = {
    foo = { ip = ["2001:0db8:85a3:0000:0000:8a2e:0370:7334", ] }
    bar = { ip = ["2001:db8::2:1, but 2001:db8:0000:1:1:1:1:1", ] }
  }
}

variable "cnames" {
  type        = map
  description = "DNS CNAME 記錄對應表"
  default = {
    "alias1" = "foo"
    "alias2" = "foo"
    "alias3" = "bar"
  }
}
