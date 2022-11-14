data "terraform_remote_state" "networking-dev-us-east-1" {

  backend = "remote"

  config = {
    organization = "acmecorpinfra"
    workspaces = {
      name = "networking-dev-us-east-1"
    }
  }
}