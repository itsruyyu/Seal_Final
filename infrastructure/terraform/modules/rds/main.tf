resource "aws_db_instance" "db" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.subnet_group

  tags = {
    Name = "${var.project_name}-rds"
  }
}
