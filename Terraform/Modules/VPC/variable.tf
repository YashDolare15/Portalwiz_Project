variable "cidr_block" {
  type        = string
  description = "the CIDR BLOCK FOR THE VPC"
}

variable "vpc_name" {
  type        = string
  description = "the name of the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "the CIDR BLOCK FOR THE PUBLIC SUBNET"
}

variable "availability_zone" {
  type        = string
  description = "the availability zone for the public subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "whether to map public IP on launch for the public subnet"
}

variable "public_subnet_name" {
  type        = string
  description = "the name of the public subnet"
}

