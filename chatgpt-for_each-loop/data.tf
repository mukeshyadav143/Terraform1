# # Fetch existing AMI
# data "aws_ami" "data_source" {
#   owners      = ["137112412989"]
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.9.20251014.0-kernel-6.1-x86_64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# output "ami_id" {
#   value = data.aws_ami.data_source.id
# }

# Fetch primary EC2 instance
data "aws_instance" "retriving" {
  instance_id = "i-014e4c4fa904eb7d4"
}

output "retriving_info" {
  value = data.aws_instance.retriving.public_ip
}

# # Fetch replica EC2 instance (if exists)
# data "aws_instance" "replica_service" {
#   instance_id = "i-0c08a9e2927cbfa10"  # replace with correct replica ID
# }

# output "replica_instance_info" {
#   value = data.aws_instance.replica_service
# }
