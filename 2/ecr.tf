resource "aws_ecr_repository" "repository" {
  name                 = var.application_name
  image_tag_mutability = "MUTABLE"
}