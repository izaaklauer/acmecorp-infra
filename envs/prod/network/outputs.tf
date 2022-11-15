output "region" {
  value = module.vpc.region
  description = "prod region"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "prod vpc id"
}

output "public_subnets" {
  value = module.vpc.public_subnets
  description = "prod vpc public subnets"
}

output "private_subnets" {
  value = module.vpc.private_subnets
  description = "prod vpc private subnets"
}

output "internal_security_group_id" {
  value = module.vpc.internal_security_group_id
  description = "prod vpc internal security group id"
}
