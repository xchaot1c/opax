variable "application_name" {
  description = "A name to identify the ECS service"
  default     = "bitcoin"
}

variable "namespace" {
  description = "Provides a context for the intended deployment of the Task Definition (e.g. environment, etc.)"
  default     = "xapo"
}


variable "image_tag" {
  description = "Docker image tag for ECS service"
  default     = "latest"
}

variable "ports" {
  description = "A list of port mappings to publish"
  type        = list(tuple([number, number]))
  default = [
    [8332, 8332], [8333, 8333], [18332, 18332], [18443, 18443], [1844,1844]
  ]
}
variable "network_mode" {
  description = "Network mode for service containers"
  default     = "awsvpc"
}

variable "mounts" {
  description = "A list of volume ids and mount paths for the container"
  type        = list(tuple([string, string, bool]))
  default     = []
}
