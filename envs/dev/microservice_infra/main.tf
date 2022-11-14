terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "networking-dev-us-east-1"
    }
  }
}

module "vpc" {
  source = "../../../modules/service_infra/ecs_cluster"

}