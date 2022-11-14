module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.app_name


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
}

