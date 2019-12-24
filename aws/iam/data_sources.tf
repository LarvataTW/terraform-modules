data "aws_iam_group" "created_groups" {
  for_each = var.groups
  name     = each.key
}

data "aws_iam_user" "created_users" {
  for_each = var.users
  name     = each.key
}

data "aws_iam_policy" "created_policies" {
  for_each = var.policies
  name     = each.key
}

# vim: filetype=terraform
