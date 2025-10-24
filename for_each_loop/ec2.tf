resource "aws_instance" "terraform" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = merge(
    var.ec2_tags,
    {
      Name = "Testing_instance"
    }
  )

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}


resource "aws_security_group" "allow_all" {
  name = "allow-all"

  egress {
    from_port   = 0  # from port 0 to to port 0 means all ports
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port   = 0  # from port 0 to to port 0 means all ports
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all"
  }
}
