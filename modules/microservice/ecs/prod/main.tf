terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  tags = {
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "prod"
    workload  = "microservice"
    app       = var.app_name
  }
}
