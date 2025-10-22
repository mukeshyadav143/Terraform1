variable "project" {
    default = "Roboshop"
}

variable "environment" {
    default = "dev"
}

# variable "common_name" {
#     default = "${var.project}-${var.environment}"
# }






variable "ami_id" {
    default = "ami-0341d95f75f311023"
}

variable "ec2_tags" {
    type = map 
    default = {
        Name = "Instance-Tester"
        Terraform = "true" 
        project = "Roboshop"
        environment = "QA"
    }
}

variable "ingress_ports" {
default = [80, 22, 8080, 22017, 6379]
}

