output "alb_listener_arn" {
  value = aws_lb_listener.listener.arn
  description = "dev aws alb listener arn"
}

output "execution_role_name" {
  value = aws_iam_role.execution_role.name
  description = "dev aws ecs execution role name"
}

output "task_role_name" {
  value = aws_iam_role.task_role.name
  description = "dev aws ecs task role name"
}

# NOTE(izaak): it would be possible for waypoint to source this data
# From these other workspaces directly, but abstracting that here allows
# each waypoint app to pull from one TFC workspace per waypoint workspace (environment).

output "ecs_cluster_name" {
  value = data.terraform_remote_state.microservice-infra-dev-us-east-1.outputs.ecs_cluster_name
  description = "dev ecs cluster name"
}

output "log_group_name" {
  value = data.terraform_remote_state.microservice-infra-dev-us-east-1.outputs.log_group_name
  description = "dev log group name"
}

output "region" {
  value = "us-east-1"
  description = "dev aws region"
}

# Could collate security groups into one output if waypoint dynamic defaults supported lists

output "app_security_group_id" {
  value = aws_security_group.app.id
  description = "dev security group for this app in particular"
}

output "internal_security_group_id" {
  value = data.terraform_remote_state.networking-dev-us-east-1.outputs.internal_security_group_id
  description = "dev security group applied to all services internal to the VPC"
}

output "ecs_task_subnets" {
  value = data.terraform_remote_state.networking-dev-us-east-1.outputs.private_subnets
  description = "dev private subnets for ecs tasks to be deployed into"
}
