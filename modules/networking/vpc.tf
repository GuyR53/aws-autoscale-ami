
# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = "${var.environment}"
  }
}

# Public Subnet AZ1
resource "aws_subnet" "PublicSubnet_AZ1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_AZ1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name  = "${var.environment}-PublicSubnet"
    Environment = "${var.environment}"
  }
}

# Public Subnet AZ2
resource "aws_subnet" "PublicSubnet_AZ2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_AZ2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name  = "${var.environment}-PublicSubnet"
    Environment = "${var.environment}"
  }
}



