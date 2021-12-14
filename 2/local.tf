locals {
    mounts = [["bitcoin-efs", "/bitcoin", false]]
    efs_volumes = [["bitcoin-efs", "/bitcoin", aws_efs_file_system.this.id]]
}


