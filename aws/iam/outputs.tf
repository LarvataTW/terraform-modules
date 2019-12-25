output "created_groups" {
  value = values(aws_iam_group._groups)[*]
}

output "created_users" {
  value = values(aws_iam_user._users)[*]
}

output "created_user_passwords" {
  value = values(aws_iam_user_login_profile._user_passwords)[*]
}

output "created_policies" {
  value = values(aws_iam_policy._policies)[*]
}

# vim: filetype=terraform
