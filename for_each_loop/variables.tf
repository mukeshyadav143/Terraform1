variable "instances" {
#   default = [ "mongodb", "redis", "frontend" ]
     default = {
         devOps = "t2.nano"
         MLOps = "t2.micro"
         LLMOps = "t2.small"
      }
 }

variable "zone_id" {
  default = "Z04630911F8AT8HAPU0R1"
}

variable "domain_name" {
  default = "mlopstechmukesh.online"
}
