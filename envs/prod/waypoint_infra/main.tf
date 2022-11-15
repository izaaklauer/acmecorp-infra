terraform {
  cloud {
    organization = "acmecorpinfra"

    workspaces {
      name = "waypoint-infra-prod-us-east-1"
    }
  }
}



