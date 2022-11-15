terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "microservice-infra-prod-us-east-1"
    }
  }
}

module "ecs_cluster" {
  source = "../../../modules/microservice_infra/ecs_cluster"

  cluster_name = "acmecorp_microservices_prod"

  tags = {
    workload  = "microservices"
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "prod"
  }
}

