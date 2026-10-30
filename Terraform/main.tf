module "vpc" {
  source                  = "./modules/VPC"
  cidr_block              = var.vpc_cidr_block
  vpc_name                = var.vpc_name
  public_subnet_cidr      = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  public_subnet_name      = var.public_subnet_name

}

module "security_group" {
  source              = "./modules/Security_Group"
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
  ssh_allowed_ip      = var.ssh_allowed_ip
  http_allowed_ip     = var.http_allowed_ip
  rds_allowed_ip      = var.rds_allowed_ip
  outbound_allowed_ip = var.outbound_allowed_ip

}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}


module "EC2" {
  source                      = "./modules/EC2"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_id       = module.security_group.security_group_id
  subnet_id                   = module.vpc.public_subnet
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  instance_name               = var.instance_name

  iam_instance_profile = module.iam.ec2_instance_profile_name
}


module "ecr" {
  source = "./Modules/ECR"

  repository_name = "portalwiz"
}

module "iam" {
  source = "./Modules/IAM"
}