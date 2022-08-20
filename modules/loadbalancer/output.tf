output "elb" {
  value = aws_elb.elb
}

output "elb_dns" {
  value = aws_elb.elb.dns_name

}
#output "aws_target_group_arn" {
#  value = aws_lb_target_group.ec2s.arn
#}

output "elb_id" {
  value = aws_elb.elb.id
}
