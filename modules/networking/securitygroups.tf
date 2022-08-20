# Public Security Group
resource "aws_security_group" "public" {
  name = "${var.environment}-public-sg"
  description = "Public internet access"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "${var.environment}-public-sg"
    Role        = "public"
    Environment = var.environment
  }
}
# Allow all outbound
resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public.id
}
# Allow my computer to ssh
resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["79.178.222.19/32"]
  security_group_id = aws_security_group.public.id
}

# Allow all http to app
resource "aws_security_group_rule" "public_in_http_80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
