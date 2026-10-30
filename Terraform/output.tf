output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "security_group_name" {
  value = module.security_group.security_group_name
}

output "ec2_instance_id" {
  value = module.EC2.instance_id
}

output "ec2_instance_public_ip" {
  value = module.EC2.instance_public_ip
}


output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecr_repository_arn" {
  value = module.ecr.repository_arn
}

output "ecr_registry_id" {
  value = module.ecr.registry_id
}