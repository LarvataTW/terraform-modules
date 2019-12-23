variable "groups" {
  type        = map
  description = "AWS IAM 群組配置，給予 Policies 以及 Users"
  default = {
    group_name = {
      path = "/groups/"
    }
  }
}

variable "users" {
  type        = map
  description = "AWS IAM 帳號配置"
  default = {
    user_name = {
      path  = "/users/"
      group = ""
    }
  }
}
