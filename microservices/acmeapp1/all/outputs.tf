output "ecr_repository_name" {
  value = module.ecs_service.ecr_repository_name
  description = "ecr registry name"
}