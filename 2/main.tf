resource "aws_cloudwatch_log_group" "log" {
  name              = format("ecs/%s", var.application_name)
  retention_in_days = 14
}

module "task_definition" {
  source = "./modules/ecs_task"

  ecr_repository_url = aws_ecr_repository.repository.repository_url
  image_tag          = var.image_tag
  log_group          = aws_cloudwatch_log_group.log.name
  ports              = var.ports
  network_mode       = var.network_mode
  execution_role_arn = aws_iam_role.bitcoin_ecs_task_execution.arn
  namespace          = var.namespace
  application_name   = var.application_name
  type               = "default"
  mounts             = local.mounts
  efs_volumes        = local.efs_volumes
}
