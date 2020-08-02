variable "datacenter" {}
variable "resource_pool" {}

variable "folder" {
  default     = string
  description = "VMware folder 的絕對路徑"
}

variable "linked_clone" {
  default     = false
  description = "Clone this virtual machine from a snapshot. Templates must have a single snapshot only in order to be eligible. Default: false. This is useful for discovering certain disk settings while performing a linked clone, as all settings that are output by this data source must be the same on the destination virtual machine as the source."
}

variable "time_zone" {
  default = "Asia/Taipei"
}

variable "dns_servers" {
  type    = "list"
  default = ["168.95.1.1", "8.8.8.8"]
}

variable "machines" {
  type        = "map"
  description = "主機屬性列表，每組 {} 內定義主機各個屬性"
  default = {
    vm_name = {
      template_name = ""
      datastore     = ""
      disk_size     = ""
      num_cpus      = ""
      memory        = ""
      domain        = ""
      network       = ""
      gateway       = ""
      netmask       = ""
      ip            = ""
    }
  }
}
