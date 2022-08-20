
# Internet Gateway for internet access to the vpc
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-InternetGTW"
    Environment = "${var.environment}"
  }
}
