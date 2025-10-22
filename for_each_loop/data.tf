data "aws_ami" "data_source" {
  owners      = ["137112412989"]
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9.20251014.0-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_instance" "data_service" {
  instance_id = "i-0c08a9e2927cbfa09"
}

output "mongodb_info" {
  value = data.aws_instance.data_service
}


data "aws_instance" "data_service" {
  instance_id = "i-0c08a9e2927cbfa09"
}

output "mongodb_info" {
  value = data.aws_instance.data_service
}
