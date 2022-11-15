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

module "ecs_app_infra" {
  region = "us-east-1"

  # Names to be encoded into resource names
  project_name = "acmeapp1"
  waypoint_workspace_name = "dev" # Worth discussing

  # Optional params, will create if not specified
  vpc_id = ""
  log_group_name = "" #
  security_group_ids = []
  task_role_id = ""
  task_role_policy_id = "" # attach custom policy
  execution_role_id = ""

  alb {
    create = true
    internal = true
    security_group_id = "" # optional
  }

  ecr_repository {
    # Recommend only one for all workspaces
    create = true # default false
    retention = "..."
  }

  # NOTE(evan): include the waypoint project spec and the waypoint hcl in the demo that includes this.
  # Use wp-vars.hcl in that demo, so the vars is all you need to configure

  /*
  Outputs:
  - region
  - subnets
  - ecr_registry_name
  - ecs_cluster_name
  - log_group_name
  - execution_role_name
  - task_role_name
  - alb_listener_arn
  - app_security_group_ids
  */
}