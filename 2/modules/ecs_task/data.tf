
data "aws_region" "current" {}

data "template_file" "task_definition" {
  template = <<EOF
[
  {
    "name": "$${ServiceName}",
    "image": "$${ServiceImage}",
    "essential": true,
    "cpu": $${ServiceCPU},
    "memory": $${ServiceMemory}
    $${Ports}$${Logging}$${MountPoints}
  }
]

EOF
  vars = {
    ServiceName =   var.application_name
    ServiceImage  = join(":", [var.ecr_repository_url, var.image_tag])
    ServiceCPU    = var.cpu
    ServiceMemory = var.memory
    Ports         = length(var.ports) > 0 ? ",\n\"portMappings\": [\n\t ${join(",\n", local.rendered_ports)} ]" : ""
    Logging       = ",\n\"logConfiguration\": ${data.template_file.logging.rendered}"
    MountPoints   = length(var.mounts) > 0 ? ",\n\"mountPoints\": [\n\t ${join(",\n", local.rendered_mounts)} ]" : ""
  }
}