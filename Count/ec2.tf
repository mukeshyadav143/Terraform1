resource "aws_instance" "terraform" {
  count = 4
  ami = "ami-0341d95f75f311023"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name      = "terraform"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "not-changable"
  description = "Allow all inbound traffic"

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["10.1.0.0/18"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}