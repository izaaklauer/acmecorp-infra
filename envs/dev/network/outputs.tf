output "region" {
  value = module.vpc.region
  description = "dev region"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "dev vpc id"
}

output "public_subnets" {
  value = module.vpc.public_subnets
  description = "dev vpc public subnets"
}

output "private_subnets" {
  value = module.vpc.private_subnets
  description = "dev vpc private subnets"
}

output "internal_security_group_id" {
  value = module.vpc.internal_security_group_id
  description = "dev vpc internal security group id"
}