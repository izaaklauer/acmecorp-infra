terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "acmeapp1-prod-us-east-1"
    }
  }
}

module "ecs_service" {
  source = "../../../modules/microservice/ecs/prod"
  app_name = "acmeapp1"
}
