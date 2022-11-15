terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "networking-dev-us-east-1"
    }
  }
}

module "vpc" {
  source = "../../../modules/network/vpc"

  vpc_name = "acmecorp-dev"

  tags = {
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "dev"
  }
}
