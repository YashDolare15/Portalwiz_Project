# IAM Role for EC2

resource "aws_iam_role" "ec2_ecr_role" {
  name = "portalwiz-ec2-ecr-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name      = "portalwiz-ec2-ecr-role"
    ManagedBy = "Terraform"
  }
}

# Attach ECR Read-Only Policy

resource "aws_iam_role_policy_attachment" "ecr_readonly" {
  role       = aws_iam_role.ec2_ecr_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# EC2 Instance Profile

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "portalwiz-ec2-instance-profile"
  role = aws_iam_role.ec2_ecr_role.name
}