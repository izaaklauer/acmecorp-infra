terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "microservice-infra-dev-us-east-1"
    }
  }
}

module "ecs_cluster" {
  source = "../../../modules/microservice_infra/ecs_cluster"

  cluster_name = "acmecorp_microservices_dev"

  tags = {
    workload  = "microservices"
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "dev"
  }
}