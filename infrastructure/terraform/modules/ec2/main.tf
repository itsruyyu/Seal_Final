resource "aws_security_group" "ssh_sg" {
  name        = "ssh_security_group"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  security_groups = [aws_security_group.ssh_sg.name]

  tags = {
    Name = "Example Instance"
  }

  key_name = var.key_name
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = var.security_group_ids
}
