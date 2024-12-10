resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-ec2"
  }

  user_data = file(var.user_data_file) # Script untuk provisioning
}
