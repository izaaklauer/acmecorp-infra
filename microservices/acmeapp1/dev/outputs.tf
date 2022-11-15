output "alb_listener_arn" {
  value = module.ecs_service.alb_listener_arn
  description = "dev aws alb listener arn"
}

output "execution_role_name" {
  value = module.ecs_service.execution_role_name
  description = "dev aws ecs execution role name"
}

output "task_role_name" {
  value = module.ecs_service.task_role_name
  description = "dev aws ecs task role name"
}

output "ecs_cluster_name" {
  value = module.ecs_service.ecs_cluster_name
  description = "dev ecs cluster name"
}

output "log_group_name" {
  value = module.ecs_service.log_group_name
  description = "dev log group name"
}

output "region" {
  value = module.ecs_service.region
  description = "dev aws region"
}

# Could collate security groups into one output if waypoint dynamic defaults supported lists

output "app_security_group_id" {
  value = module.ecs_service.region
  description = "dev security group for this app in particular"
}

output "internal_security_group_id" {
  value = module.ecs_service.region
  description = "dev security group applied to all services internal to the VPC"
}

output "ecs_task_subnets" {
  value = module.ecs_service.ecs_task_subnets
  description = "dev private subnets for ecs tasks to be deployed into"
}

# Waypoint is currently unable to consume list types in dynamic defaults

output "ecs_task_subnet_1" {
  value = module.ecs_service.ecs_task_subnets[0]
  description = "first dev private subnet for ecs tasks to be deployed into"
}

output "ecs_task_subnet_2" {
  value = module.ecs_service.ecs_task_subnets[1]
  description = "first dev private subnet for ecs tasks to be deployed into"
}

output "ecs_task_subnet_3" {
  value = module.ecs_service.ecs_task_subnets[2]
  description = "first dev private subnet for ecs tasks to be deployed into"
}

output "ecs_task_subnet_4" {
  value = module.ecs_service.ecs_task_subnets[3]
  description = "first dev private subnet for ecs tasks to be deployed into"
}

output "ecs_task_subnet_5" {
  value = module.ecs_service.ecs_task_subnets[4]
  description = "first dev private subnet for ecs tasks to be deployed into"
}