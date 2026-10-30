resource "aws_instance" "HELLO" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.vpc_security_group_id]
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install docker.io -y
                sudo systemctl start docker
                sudo systemctl start docker
                sudo apt install fontconfig openjdk-21-jre -y
              
             EOF

}

