
resource "aws_security_group" "my_terraform_sg" {
  name        = "my_terraform_sg"
  description = "Security group for my Terraform instance"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}

# SSH Rule
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.my_terraform_sg.id

  description = "Allow SSH from approved IP"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4   = var.ssh_allowed_ip
}

# HTTP Rule
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.my_terraform_sg.id

  description = "Allow HTTP traffic"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = var.http_allowed_ip
}

#RDS Rule
resource "aws_vpc_security_group_ingress_rule" "rds" {
  security_group_id = aws_security_group.my_terraform_sg.id

  description = "Allow RDS traffic"
  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"
  cidr_ipv4   = var.rds_allowed_ip
}

#

# Outbound Rule
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.my_terraform_sg.id

  description = "Allow outbound IPv4 traffic"
  ip_protocol = "-1"
  cidr_ipv4   = var.outbound_allowed_ip
}
