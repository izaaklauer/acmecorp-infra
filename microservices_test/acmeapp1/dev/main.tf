terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "acmeapp1-dev-us-east-1"
    }
  }
}

module "ecs_service" {
  source = "../../modules/microservice/ecs/dev"
  app_name = "acmeapp1"
}
