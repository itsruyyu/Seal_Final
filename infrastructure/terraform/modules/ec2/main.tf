
resource "aws_launch_template" "this" {
  name_prefix   = "${var.name_prefix}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name_prefix}-instance"
    }
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-asg"
    propagate_at_launch = true
  }
}