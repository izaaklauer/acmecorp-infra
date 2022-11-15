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

module "project" {
  project_name = var.app_name
  runner_profile = "acmecorp_ecs"

  data_source {
    github {
      org = "acmecorp"
      repo = var.app_name
      ref = "main"
      path = "/"
      auto_deploy = false
    }
  }

  app_status_polling {
    enabled = true
    interval = "90s"
  }

  waypoint_hcl = {
    // Optionally add server-stored waypoint hcl
    // Pull this in via hcl function file read
    // It doesn't need to have configsourcer input - we could use terraform to template values directly in
  }

  apps = [{
    # app-specific settings
  }]
}
