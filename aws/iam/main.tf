### Groups

resource "aws_iam_group" "_groups" {
  for_each = var.groups
  path     = var.groups_path
  name     = each.key
}

### Users

resource "aws_iam_user" "_users" {
  for_each = var.users
  path     = var.users_path
  name     = each.key
}

resource "aws_iam_user_group_membership" "_user_teams" {
  for_each = var.users
  user     = each.key
  groups   = [each.value.group]
}
