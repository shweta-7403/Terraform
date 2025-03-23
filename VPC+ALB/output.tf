output "name_tg" {
  value = aws_lb_target_group.tg.arn
}

output "aws_subnet_ids" {
  value = element(aws_subnet.public1.id,aws_subnet.public2.id)
}
output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
output "sg-name" {
  value = aws_security_group.ec2_sg
}