output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id_az1" {
  value = aws_subnet.PublicSubnet_AZ1.id
}

output "public_subnet_id_az2" {
  value = aws_subnet.PublicSubnet_AZ2.id
}



output "public_security_group" {
  value = aws_security_group.public.id
}

