#  Creates the network topology
module "networking" {
  source = "./modules/networking"
  # Passing the environment
  environment          = var.environment
  # Passing vpc_cidr
  vpc_cidr             = var.vpc_cidr
  # Passing Public subnet cidr AZ1
  public_subnet_cidr_AZ1  = var.public_subnet_cidr_AZ1
    # Passing Public subnet cidr AZ2
  public_subnet_cidr_AZ2  = var.public_subnet_cidr_AZ2
}

# the ec2 instance I made the image from
module "ec2" {
  source = "./modules/ec2"
  # Creating ec2s with the names and numbers as we pass in the list
  vm_names = ["Machine-1"]
  # Passing the app subnetID, creating the machines in the right subnet
  public_subnet_id_az1 = module.networking.public_subnet_id_az1
  # Passing publickey for the machines
  public_key = var.public_key
  # Passing public security group
  public_security_group = module.networking.public_security_group
  # Passing the environment
  environment = var.environment
}

# Creating load balancer for app
module "loadbalancer" {
  source = "./modules/loadbalancer"
  # Passing app security group
  public_security_group = module.networking.public_security_group
  # Passing 2 public subnets with different AZ
  public_subnet_id_az1 = module.networking.public_subnet_id_az1
  public_subnet_id_az2 = module.networking.public_subnet_id_az2
  # Passing vpc id
  vpc_id = module.networking.vpc_id
}

module "ec2-auto-scaling" {
  source = "./modules/ec2-auto-scaling"
  public_subnet_id_az1 = module.networking.public_subnet_id_az1
  public_subnet_id_az2 = module.networking.public_subnet_id_az2
  public_security_group=module.networking.public_security_group
  elb_id = module.loadbalancer.elb_id
}