### Groups

resource "aws_iam_group" "_groups" {
  for_each = var.groups
  name     = each.key
  path     = each.value.path
}

### Users

resource "aws_iam_user" "_users" {
  for_each = var.users
  name     = each.key
  path     = each.value.path
}

resource "aws_iam_user_group_membership" "_user_teams" {
  for_each = var.users
  user     = each.key
  groups   = [each.value.group]
}
