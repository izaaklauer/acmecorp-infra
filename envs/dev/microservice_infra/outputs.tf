output "ecs_cluster_name" {
  value = module.ecs_cluster.log_group_name
  description = "dev ecs cluster name"
}

output "log_group_name" {
  value = module.ecs_cluster.log_group_name
  description = "dev log group name for services running on this cluster"
}