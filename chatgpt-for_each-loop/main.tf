# ##############################################
# # 🌍 VARIABLE ASSIGNING – list of instance types
# ##############################################

# # List variable containing EC2 instance types to be launched
# # This list will be converted to a set for for_each loop
# variable "instance_types" {
#   description = "List of EC2 instance types to be launched"
#   type        = list(string)
#   default     = ["t2.nano", "t2.micro", "t2.small"]  # demo types
# }

# ##############################################
# # 🔐 SECURITY GROUP – allows traffic for EC2
# ##############################################

# # Security group to attach to EC2s
# # Opens all inbound/outbound traffic (demo purposes only)
# resource "aws_security_group" "allow_all" {
#   name        = "allow_all_sg"
#   description = "Allows all inbound and outbound traffic"

#   # Ingress rule: allow all ports and protocols from any IP
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Egress rule: allow all ports and protocols to any IP
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# ##############################################
# # 🚀 EC2 RESOURCE – for_each loop on list
# ##############################################

# # Creating EC2 instances dynamically using for_each
# # List is converted to set using toset() to ensure valid iteration
# resource "aws_instance" "terraform" {
#   for_each = toset(var.instance_types)  # converts list to set, removes duplicates

#   ami                    = "ami-0341d95f75f311023"      # Amazon Linux 2 AMI
#   instance_type          = each.value                   # picks current instance type
#   vpc_security_group_ids = [aws_security_group.allow_all.id]  # attach demo SG

#   # Tagging resources for easy identification
#   tags = {
#     Name      = each.value      # tag name = instance type
#     Terraform = "true"          # identifies Terraform-managed resources
#   }
# }

# ##############################################
# # ✅ Notes for demo
# ##############################################

# # 1. Each EC2 will be created per unique instance type in the list.
# # 2. Duplicate types in the list will be automatically removed by toset().
# # 3. Security group is attached to all EC2s.
# # 4. For demo: keep everything in main.tf, run terraform init → plan → apply.
# # 5. Tags help identify which instance type corresponds to which EC2.
