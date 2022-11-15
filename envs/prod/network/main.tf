terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "networking-prod-us-east-1"
    }
  }
}

module "vpc" {
  source = "../../../modules/network/vpc"

  vpc_name = "acmecorp-prod"

  tags = {
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "prod"
  }
}
