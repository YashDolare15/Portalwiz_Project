variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region to deploy resources in"
}


variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR Block for myb VPC"
}

variable "vpc_name" {
  type        = string
  default     = "yash-terraform-vpc"
  description = "The name of the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "The CIDR Block for the public subnet"
}

variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "The availability zone for the public subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = true
  description = "Whether to map public IP on launch"
}

variable "public_subnet_name" {
  type        = string
  default     = "yash-terraform-public-subnet"
  description = "The name of the public subnet"
}

variable "security_group_name" {
  type        = string
  default     = "my-terraform-sg"
  description = "The name of the security group"
}

variable "ssh_allowed_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The IP address allowed to SSH into the instance"
}

variable "http_allowed_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The IP address allowed to access HTTP on the instance"
}

variable "rds_allowed_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The IP address allowed to access RDS on the instance"
}

variable "outbound_allowed_ip" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The IP address allowed for outbound traffic from the instance"
}

variable "instance_type" {
  type        = string
  default     = "c7i-flex.large"
  description = "The instance type for the EC2 instance"
}

variable "key_name" {
  type        = string
  default     = "Portalwiz"
  description = "The key pair name for the EC2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Whether to associate a public IP address with the EC2 instance"
}

variable "instance_name" {
  type        = string
  default     = "my-terraform-instance"
  description = "The name tag for the EC2 instance"
}
