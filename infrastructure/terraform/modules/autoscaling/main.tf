resource "aws_launch_configuration" "example" {
  name            = "example-launch-config"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_group_id
}

resource "aws_autoscaling_group" "example" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.example.id
}
