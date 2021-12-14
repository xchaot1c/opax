locals {
  users_to_create     = lookup(var.iam_definition, "users")
  groups_to_create    = lookup(var.iam_definition, "groups")
  roles_to_create     = lookup(var.iam_definition, "roles")
  policy_to_create    = lookup(var.iam_definition, "policies")
  users_to_group_map  = lookup(var.iam_definition, "users_to_group_map")
  policy_to_group_map = lookup(var.iam_definition, "policy_to_group_map")
  prefix              = lookup(var.iam_definition, "prefix")
}
