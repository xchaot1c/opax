
resource "aws_iam_group" "this" {
  for_each = toset(local.groups_to_create)
  name     = format("%s%s", local.prefix, each.value)
}

resource "aws_iam_user" "this" {
  for_each = toset(local.users_to_create)
  name     = format("%s%s", local.prefix, each.value)
}

resource "aws_iam_role" "this" {
  for_each           = local.roles_to_create
  name               = format("%s%s", local.prefix, each.key)
  path               = "/system/"
  assume_role_policy = each.value
}

resource "aws_iam_policy" "this" {
  for_each   = local.policy_to_create
  name        = format("%s%s",local.prefix, each.key)
  policy      = each.value
}

resource "aws_iam_group_membership" "this" {
  depends_on = [aws_iam_group.this, aws_iam_user.this]
  for_each   = local.users_to_group_map
  name       = format("%s%s", local.prefix, each.key )
  users      = [for value in each.value : format("%s%s", local.prefix, value)]
  group      = aws_iam_group.this[each.key].name
}

resource "aws_iam_group_policy_attachment" "this" {
  depends_on = [aws_iam_group.this, aws_iam_user.this, aws_iam_policy.this]
  for_each   = local.policy_to_group_map
  group      = format("%s%s", local.prefix, each.key)
  policy_arn = aws_iam_policy.this[each.value].arn
}