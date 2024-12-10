output "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  value       = aws_autoscaling_group.web.name
}

output "launch_configuration_name" {
  description = "Name of the launch configuration"
  value       = aws_launch_configuration.web.name
}
