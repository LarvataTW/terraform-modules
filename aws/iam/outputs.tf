output "created_groups" {
  value = values(aws_iam_group._groups)[*]
}

output "created_users" {
  value = values(aws_iam_group._users)[*]
}

output "created_policies" {
  value = values(aws_iam_group._policies)[*]
}

# vim: filetype=terraform
