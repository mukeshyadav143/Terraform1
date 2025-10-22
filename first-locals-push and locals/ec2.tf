# below code will create a EC2 isntance named terraform
resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.newly-created-group.id]
  tags = merge(
  var.ec2_tags,
  {
    Name = "${local.common_name}-local-work"
  }
)
provisioner "local-exec" {
  command = "echo ${self.private_ip} > inventory"
}
}



# Below code will creae the security group named ALLOWING-ALL-GROUPS
resource "aws_security_group" "newly-created-group" {
  name   = "${local.common_name}-allow-all"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
    from_port        = ingress.value # from port 0 to to port 0 means all ports
    to_port          = ingress.value 
    protocol         = "tcp" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
    }
 
  }

  tags = {
    Name = "${local.common_name}-allow-all"
  }

}