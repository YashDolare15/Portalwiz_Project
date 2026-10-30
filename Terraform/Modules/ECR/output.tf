output "repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.my_ecr_repository_portalwiz.name
}

output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.my_ecr_repository_portalwiz.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.my_ecr_repository_portalwiz.arn
}

output "registry_id" {
  description = "AWS account registry ID"
  value       = aws_ecr_repository.my_ecr_repository_portalwiz.registry_id
}