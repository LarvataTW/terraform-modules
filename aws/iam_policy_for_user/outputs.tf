output "created_groups" {
  value = values(aws_iam_group._groups)[*]
}

output "created_users" {
  value = values(aws_iam_user._users)[*]
}

output "created_access_keys" {
  value = values(aws_iam_access_key._access_key)[*]
}

output "created_policies" {
  value = values(aws_iam_policy._policies)[*]
}

# vim: filetype=terraform
