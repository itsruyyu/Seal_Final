output "private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  value = aws_security_group.default.id
}

output "public_subnets" {
  description = "List of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnets"
  value       = module.vpc.private_subnets
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.ec2.autoscaling_group_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.endpoint
}
