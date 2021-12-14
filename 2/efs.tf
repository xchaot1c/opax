resource "aws_efs_file_system" "this" {
  creation_token = format("%s-efs", var.application_name)
  tags = {
    Name    = format("%s-efs", var.application_name)
  }
}

resource "aws_efs_access_point" "this" {
  file_system_id = aws_efs_file_system.this.id
  posix_user {
    gid = 1000
    uid = 1000
  }
  root_directory {
    path = "/bitcoin"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = 755
    }
  }
  tags = {
    Name    = var.application_name
  }
}