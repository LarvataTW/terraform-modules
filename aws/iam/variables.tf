variable "groups_path" {
  type    = string
  default = "/groups/"
}

variable "groups" {
  type        = map
  description = "AWS IAM 群組配置"
  default = {
    group_name = {}
  }
}

variable "users_path" {
  type    = string
  default = "/users/"
}

variable "users" {
  type        = map
  description = "AWS IAM 帳號配置"
  default = {
    user_name = {
      group = ""
    }
  }
}
