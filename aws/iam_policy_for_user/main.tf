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
  groups   = split(", ", each.value.group)

  depends_on = [
    aws_iam_group._groups,
    aws_iam_user._users,
  ]
}

### Policies

resource "aws_iam_policy" "_policies" {
  for_each    = var.policies
  path        = var.policies_path
  name        = each.key
  description = each.value.description
  policy      = each.value.policy_json
}

resource "aws_iam_policy_attachment" "_policy_teams" {
  for_each   = var.policies
  policy_arn = aws_iam_policy._policies[each.key].arn
  users      = [each.value.user]
  name       = "attachment_${each.key}"

  depends_on = [
    aws_iam_group._groups,
    aws_iam_user._users,
    aws_iam_policy._policies,
  ]
}

### Access_key 

resource "aws_iam_access_key" "_access_key" {  
  for_each  = var.users
  user      = each.key
  pgp_key   = var.pgp_key
  
  depends_on = [
    aws_iam_group._groups,
    aws_iam_user._users,
    aws_iam_policy._policies,
  ]
}
