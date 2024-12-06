resource "aws_db_instance" "example" {
  identifier        = "example-db"
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  username          = var.db_username
  password          = var.db_password
  db_name           = "exampledb"
  skip_final_snapshot = true
  multi_az          = false
  storage_type      = "gp2"
  vpc_security_group_ids = [var.vpc_security_group_id]

  tags = {
    Name = "Example RDS Instance"
  }
}

output "endpoint" {
  value = aws_db_instance.example.endpoint
}
