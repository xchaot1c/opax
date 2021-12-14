variable "application_name" {
  description = "A name to identify the ECS service"
}

variable  "ecr_repository_url" {
  description = "ECR repository url"
}

variable "type" {
  description = "A suffix applied to the family to indicate sub-module type"
  default     = ""
}

variable "image_tag" {
  description = "Docker image tag for ECS service"
  default     = ""
}

variable "ports" {
  description = "A map of published ports for the ECS task"
  type        = list(tuple([number, number]))
  default     = []
}

variable "cpu" {
  description = "Required vCPU units for the service"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Required memory for the service"
  type        = number
  default     = 256
}

variable "launch_type" {
  description = "Launch an `EC2` or `FARGATE` service"
  default     = "ec2"
}

variable "network_mode" {
  description = "Network mode for service containers (available options: `bridge`, `host`, `awsvpc`)"
  default     = "bridge"
}

variable "tasks_desired" {
  description = "Suggested number of tasks for the ECS service"
  type        = number
  default     = 1
}

variable "execution_role_arn" {
  description = "Arn of the IAM Role assumed by ECS Tasks for initialisation"
}

variable "namespace" {
  description = "Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.)"
  default     = ""
}

variable "log_group" {
  description = "Name of the CloudWatch Log Group for service logging"
}

variable "task_secrets" {
  description = "A map of sensitive environment variables configured on the primary container"
  type        = map(string)
  default     = {}
}

variable "docker_labels" {
  description = "A map of docker labels to attach to the container definition"
  type        = map(any)
  default     = {}
}

variable "efs_volumes" {
  description = "A list of creation tokens of EFS volumes to mount on the container"
  type        = list(tuple([string, string, string]))
  default     = []
}

variable "mounts" {
  description = "A list of volume ids and mount paths for the container"
  type        = list(tuple([string, string, bool]))
  default     = []
}
