terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "networking-prod-us-east-1"
    }
  }
}

module "vpc" {
  source  = "app.terraform.io/acmecorpinfra/acmecorp-network/aws"
  version = "0.0.1"

  vpc_name = "acmecorp-prod"

  tags = {
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "prod"
  }
}
