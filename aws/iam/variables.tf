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

variable "policies_path" {
  type    = string
  default = "/policies/"
}

variable "policies" {
  type        = map
  description = "AWS IAM Policy 配置"
  default = {
    policy_name = {
      policy_json = "Policy 的 JSON 定義"
      description = "Policy 描述"
      group       = "Policy 所屬於的 IAM Group"
    }
  }
}

variable "pgp_key" {
  type    = string
  default = "keybase:some_person_that_exists"
}

variable "users_has_key" {
  type        = list
  description = "AWS IAM User配置Key"
  default     = []
}
