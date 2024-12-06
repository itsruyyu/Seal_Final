output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.example.endpoint
}

output "rds_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.example.id
}
