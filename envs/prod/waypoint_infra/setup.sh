#!/bin/bash

# Command generated with the waypoint UI
waypoint runner install \
  -platform=ecs \
  -server-addr=api.hashicorp.cloud:443 \
  -ecs-runner-image=hashicorp/waypoint \
  -ecs-cluster=acmecorp_waypoint_infra \
  -ecs-region=us-east-1

# Need a terraform API token in the environment
waypoint config source-set -type=terraform-cloud -config=token=$TFC_TOKEN