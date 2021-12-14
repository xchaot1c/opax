
module "task_definition" {
  source = "./modules/iam"

  iam_definition = {
    users  = ["user-a", "user-b"]
    groups = ["group-a", "group-b"]
    users_to_group_map = ({
      group-a = ["user-a", "user-b"]
      group-b = ["user-b"]
    }),
    roles = ({
      role-a = data.aws_iam_policy_document.assume_role_policy.json
    })
    policies = ({
      policy-a = data.aws_iam_policy_document.group_policy.json
    })
    policy_to_group_map = ({
      group-b = "policy-a"
    })
    prefix =  local.prefix
  }
}
