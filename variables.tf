variable "secret_key" {
  default = ""
  description = "secret key authentication"
}
variable "access_key" {
  default = ""
  description = "access key authentication"
}


variable "region" {
  description = "us-east-1"
  default = "us-east-1"
}

variable "environment" {
  description = "The Deployment environment"
  default = "Test"
}

//networking
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "The CIDR block of the vpc"
}

variable "public_subnet_cidr_AZ1" {
  default    = "10.0.1.0/24"
  description = "The CIDR block for the public subnet AZ1"
}

variable "public_subnet_cidr_AZ2" {
  default    = "10.0.2.0/24"
  description = "The CIDR block for the public subnet AZ2"
}

variable "public_key" {
  default = ""
  description = "pubkey that we create for the machines"
}

