# Cluster specifically for waypoint runners (static and odr) which can target all environments
module "ecs_cluster" {
  source = "../../../modules/microservice_infra/ecs_cluster"

  cluster_name = "acmecorp_waypoint_infra"

  tags = {
    workload  = "waypoint_infra"
    corp      = "acmecorp"
    owner     = "izaak"
    terraform = "true"
    env       = "prod"
  }
}

