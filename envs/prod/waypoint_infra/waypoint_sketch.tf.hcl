terraform {
  required_providers {
    waypoint = {
      source  = "hashicorp/waypoint"
      version = "~> 0.1"
    }
  }
}

provider "waypoint" {
  hcp = true
}

module "ecs_runner" {
  image = "hashicorp/waypoint:v0.11.0"
  region = "us-east-1"
  subnets = data.terraform_remote_state.networking-dev-us-east-1.outputs.private_subnets
  ecs_cluster = module.ecs_cluster.ecs_cluster_name

  # Optional inputs, will create if not specified
  execution_role_name = "..."
  task_role_name = "..."
  task_role_policy = "..."
  security_group_id = "..."
  nlb_arn = "..."

  efs {
    throughput_mode = "bursting"
    encryption {
      enabled = true
      kms_key_arn = module.kms.waypoint_infra.arn # managed independently
    }
  }

  create_default_profile = false # enable manual configuration of the profile
}

resource "runner_profile" "ecs" {
  name = "acmecorp_ecs"
  default = true
  image = "hashicorp/waypoint-odr:v0.11.0"
  cpu = 1024
  memory = 2048

  log_group = module.ecs_cluster.log_group_name
  security_group = module.ecs_runner.security_gruop_id
  subnets = data.terraform_remote_state.networking-dev-us-east-1.outputs.private_subnets
  task_role_name = module.ecs_runner.task_role_name
}

# Workspaces
resource "workspace" "dev" {
  name = "dev"
}

resource "workspace" "prod" {
  name = "prod"
}

# Configsourcer config
resource "configsourcer" "terraform-cloud" {
  type = "terraform_cloud"
  config = {
    token = data.vault_secret_generic.tfc.data["token"]
  }
}

# Vault setup
provider "vault" {
  address = var.vault_addr
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}

data "vault_generic_secret" "tfc" {
  path = "terraform/creds/infra"
}