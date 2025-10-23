variable "instances" {
#   default = [ "mongodb", "redis", "frontend" ]
     default = {
         devOps = "t2.medium"
         MLOps = "t2.micro"
         LLMOps = "t2.small"
      }
 }

   variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
 }

variable "instance_type" {
  default = "t2.micro"
  
}

variable "ec2_tags" {
  type = map
  default = {
    Name        = "data_source"
    Terraform   = "true"
    project     = "roboshop"
    environment = "Dev"
  }
}
variable "zone_id" {
  default = "Z04630911F8AT8HAPU0R1"
}

variable "domain_name" {
  default = "mlopstechmukesh.online"
}
