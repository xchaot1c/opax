data "template_file" "ports" {
  count    = length(var.ports)
  template = <<EOF
{
  "containerPort": $${ContainerPort},
  "hostPort": $${HostPort}
}
EOF
  vars = {
    ContainerPort = var.ports[count.index][0]
    HostPort      = var.ports[count.index][1]
  }
}

data "template_file" "logging" {
  template = <<EOF
{
  "logDriver": "awslogs",
  "options": {
    "awslogs-region": "$${LogRegion}",
    "awslogs-group": "$${LogGroup}",
    "awslogs-stream-prefix": "$${LogPrefix}"
  }
}
EOF
  vars = {
    LogGroup  = var.log_group
    LogRegion = data.aws_region.current.name
    LogPrefix = var.application_name
  }
}

data "template_file" "mounts" {
  count    = length(var.mounts)
  template = <<EOF
{
  "sourceVolume": "$${MountVolume}",
  "containerPath": "$${MountPath}",
  "readOnly": $${MountReadOnly}
}
EOF
  vars = {
    MountVolume   = var.mounts[count.index][0]
    MountPath     = var.mounts[count.index][1]
    MountReadOnly = var.mounts[count.index][2]
  }
}
