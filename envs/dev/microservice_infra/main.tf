terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "microservice-infra-dev-us-east-1"
    }
  }
}

module "ecs_cluster" {
  source  = "app.terraform.io/acmecorpinfra/acmecorp-microservice-infra/aws"
  version = "0.0.1"

  cluster_name = "acmecorp_microservices_dev"

  tags = {
    workload  = "microservices"
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "dev"
  }
}