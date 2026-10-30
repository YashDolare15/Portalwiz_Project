resource "aws_ecr_repository" "my_ecr_repository_portalwiz" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name      = var.repository_name
    ManagedBy = "Terraform"
  }
}