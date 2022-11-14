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

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "4.1.2"
}

resource "aws_ecs_cluster" "services" {
  name = var.cluster_name
  tags = var.tags

  configuration {
    execute_command_configuration {
      log_configuration {
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.services.name
      }
    }
  }
}

resource "aws_cloudwatch_log_group" "services" {
  name = var.cluster_name
}