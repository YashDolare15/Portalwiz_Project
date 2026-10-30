variable "ami" {
  type        = string
  description = "the AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "the instance type for the EC2 instance"
}

variable "vpc_security_group_id" {
  type        = string
  description = "the security group IDs for the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "the subnet ID for the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "the key pair name for the EC2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "whether to associate a public IP address with the EC2 instance"
}

variable "instance_name" {
  type        = string
  description = "the name tag for the EC2 instance"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile attached to EC2"
}