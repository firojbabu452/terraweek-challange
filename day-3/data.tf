
data "aws_availability_zones" "available" {
  state = "available"
}

# Latest Amazon Linux 2023 AMI instead of a hard-coded id, which is
# region-specific and goes stale as Amazon publishes patched images.
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}