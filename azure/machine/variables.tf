variable "resource_group" {
  type        = string
  description = "Azure Resource Group 名稱"
}
variable "network" {
  type        = string
  description = "Azure vNetwork 名稱"
}

variable "timezone" {
  type    = string
  default = "Asia/Taipei"
}

variable "environment" {
  type        = string
  default     = "staging" # production / staging
  description = "貼在主機上的 environment tag"
}

variable "username" {
  type        = string
  default     = "ubuntu"
  description = "主機預設的管理帳號"
}

variable "password" {
  type        = string
  default     = "12345678"
  description = "主機管理帳號的預設密碼"
}

variable "os" {
  type = map
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

variable "machines" {
  type        = map
  description = "主機屬性列表，每組 {} 內定義主機各個屬性"
  default = {
    vm_name = {
      vm_size   = "Standard_B1S" # https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/#Linux
      subnet    = ""
      ip        = ""
      disk_size = 1 # GB for storage data disk
    }
  }
}
