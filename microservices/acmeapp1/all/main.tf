terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "acmeapp1-all-us-east-1"
    }
  }
}

module "ecs_service" {
  source = "../../../modules/microservice/ecs/all"
  app_name = "acmeapp1"
}