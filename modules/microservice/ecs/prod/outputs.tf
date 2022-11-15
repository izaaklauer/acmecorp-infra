output "alb_listener_arn" {
  value = aws_lb_listener.listener.arn
  description = "prod aws alb listener arn"
}

output "execution_role_name" {
  value = aws_iam_role.execution_role.name
  description = "prod aws ecs execution role name"
}

output "task_role_name" {
  value = aws_iam_role.task_role.name
  description = "prod aws ecs task role name"
}

# NOTE(izaak): it would be possible for waypoint to source this data
# From these other workspaces directly, but abstracting that here allows
# each waypoint app to pull from one TFC workspace per waypoint workspace (environment).

output "ecs_task_subnets" {
  value = data.terraform_remote_state.networking-prod-us-east-1.outputs.private_subnets
  description = "prod private subnets for ecs tasks to be deployed into"
}

output "ecs_cluster_name" {
  value = data.terraform_remote_state.microservice-infra-prod-us-east-1.outputs.ecs_cluster_name
  description = "prod ecs cluster name"
}

output "log_group_name" {
  value = data.terraform_remote_state.microservice-infra-prod-us-east-1.outputs.log_group_name
  description = "prod log group name"
}

output "region" {
  value = "us-east-1"
  description = "prod aws region"
}

