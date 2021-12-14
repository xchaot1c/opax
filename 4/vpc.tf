resource "aws_vpc" "main" {
  cidr_block = "10.88.40.0/15 ( http://10.88.40.0/15 )"
  instance_tenancy = "dedicated"
  tags = {
    Name = "main"
  }
}
