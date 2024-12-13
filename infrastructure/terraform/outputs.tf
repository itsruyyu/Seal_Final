output "private_key" {
  description = "Private key for SSH access"
  value       = aws_key_pair.generated_key.key_name
  sensitive   = true
}


output "security_group_id" {
  value = aws_security_group.default.id
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}


output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.ec2.autoscaling_group_name
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.endpoint
}

output "public_subnets" {
  value = [for subnet in data.aws_subnet.default : subnet.id]
}

