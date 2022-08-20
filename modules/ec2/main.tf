# ec2 instances, thats the instance I was creating the ami from to the autoscaling group
resource "aws_instance" "app_server" {
  count           = length(var.vm_names)
  # Last version of ubuntu with the configurations I need:
  # nodejs running on pm2 with startup script (nginx as frontend and nodejs as backend)
  # nginx listens on port 80, Nodejs run on port 8000 with pm2 + startup script
  # Nginx logs must have an additional partition of 20GB mounted under  /vlog/ (new EBS volume with 21GB that got partitioned and mounted)
  # Cronjob that calls the API and report the value of HTTP location  /api/metric as a custom metric to DataDog
  ami             = "ami-040a75409ff43d5f5"
  instance_type   = "t2.micro"
  subnet_id       = var.public_subnet_id_az1
  security_groups = [var.public_security_group]
  key_name        = "id_rsa"
  associate_public_ip_address = true

  tags            = {
    Name        = "${var.vm_names[count.index]}"
    Environment = var.environment
  }
}




# ssh public key
resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = var.public_key
}