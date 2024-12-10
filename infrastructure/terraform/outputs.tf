output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.rds_endpoint
}

output "rds_instance_id" {
  description = "RDS instance ID"
  value       = module.rds.rds_instance_id
}

output "rds_security_group_id" {
  description = "ID of the RDS Security Group"
  value       = aws_security_group.rds.id
}

output "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  value       = module.autoscaling.autoscaling_group_name
}

output "launch_configuration_name" {
  description = "Name of the launch configuration"
  value       = module.autoscaling.launch_configuration_name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3.bucket_arn
}
