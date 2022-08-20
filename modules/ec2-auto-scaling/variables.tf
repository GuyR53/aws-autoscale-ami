variable "public_subnet_id_az1" {
  default = ""
  description = "public subet id az1"
}

variable "public_subnet_id_az2" {
  default = ""
  description = "public subet id az2"
}
variable "aws_target_group_arn" {
  default = ""
  description = "target group arn"
}

variable "elb_id" {
  description = "load balancer id"
}

variable "public_security_group" {
  default = ""
  description = "public security group"
}