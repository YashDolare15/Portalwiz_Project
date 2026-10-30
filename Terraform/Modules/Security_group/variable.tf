variable "security_group_name" {
  description = "name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ssh_allowed_ip" {
  description = "CIDR block for SSH access"
  type        = string
}

variable "http_allowed_ip" {
  description = "CIDR block for http access"
  type        = string
}

variable "rds_allowed_ip" {
  description = "CIDR block for RDS access"
  type        = string
}

variable "outbound_allowed_ip" {
  description = "CIDR block for outbound access"
  type        = string
}

