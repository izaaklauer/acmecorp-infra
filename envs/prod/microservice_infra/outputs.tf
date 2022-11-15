output "ecs_cluster_name" {
  value = module.ecs_cluster.log_group_name
  description = "prod ecs cluster name"
}

output "log_group_name" {
  value = module.ecs_cluster.log_group_name
  description = "prod log group name for services running on this cluster"
}