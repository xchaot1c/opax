

resource "aws_ecs_task_definition" "task_definition" {
  container_definitions = data.template_file.task_definition.rendered
  family                = join("-", compact([var.namespace, var.application_name, var.type]))
  network_mode          = var.network_mode
  execution_role_arn    = var.execution_role_arn

  dynamic "volume" {
    for_each = var.efs_volumes
    content {
      name = volume.value[0]
      efs_volume_configuration {
        file_system_id = volume.value[2]
        root_directory = volume.value[1]
      }
    }
  }
}


