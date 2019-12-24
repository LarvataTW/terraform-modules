data "aws_iam_group" "created_groups" {
  for_each   = var.groups
  group_name = each.key
}

data "aws_iam_user" "created_users" {
  for_each  = var.users
  user_name = each.key
}

data "aws_iam_policy" "created_policies" {
  for_each = var.policies
  arn      = aws_iam_policy._policies[each.key].arn
}

# vim: filetype=terraform
