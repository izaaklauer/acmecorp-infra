
locals {
  ecs_repository_name = var.app_name
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = local.ecs_repository_name


  create_lifecycle_policy           = true
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 90
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "all"
    workload  = "microservice"
    app       = var.app_name
  }
}

