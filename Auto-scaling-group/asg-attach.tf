# ASG with Existing ALB TG
resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = data.aws_subnets.default_subnets.ids   
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2

  # Existing ALB Target Group attach 
  target_group_arns = ["arn:aws:elasticloadbalancing:us-east-2:476114125943:targetgroup/web-tg-2e78d275/6d3fcb5e15afe80a"]  

  launch_template {
    id      = aws_launch_template.web_lt.id    
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ASG-Instance"
    propagate_at_launch = true
  }
}
