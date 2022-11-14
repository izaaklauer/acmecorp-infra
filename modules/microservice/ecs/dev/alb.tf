
resource "aws_lb" "alb" {
  name               = "${var.app_name}-dev"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.external.id]
  subnets            = data.terraform_remote_state.networking-dev-us-east-1.outputs.public_subnets
  enable_deletion_protection = false

  tags = local.tags
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  # Future improvement: certificate

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "${var.app_name}-dev"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.networking-dev-us-east-1.outputs.vpc_id
}


#module "alb" {
#  source  = "terraform-aws-modules/alb/aws"
#  version = "~> 8.0"
#
#  name = var.app_name
#
#  load_balancer_type = "application"
#
#  vpc_id             = data.terraform_remote_state.networking-dev-us-east-1.outputs.vpc_id
#  subnets            = data.terraform_remote_state.networking-dev-us-east-1.outputs.public_subnets
#  security_groups    = [aws_security_group.external]
#
#  target_groups = [
#    {
#      name_prefix      = "pref-"
#      backend_protocol = "HTTP"
#      backend_port     = 80
#      target_type      = "instance"
#      targets = {
#        my_target = {
#          target_id = "i-0123456789abcdefg"
#          port = 80
#        }
#        my_other_target = {
#          target_id = "i-a1b2c3d4e5f6g7h8i"
#          port = 8080
#        }
#      }
#    }
#  ]
#
#  https_listeners = [
#    {
#      port               = 443
#      protocol           = "HTTPS"
#      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#      target_group_index = 0
#    }
#  ]
#
#  http_tcp_listeners = [
#    {
#      port               = 80
#      protocol           = "HTTP"
#      target_group_index = 0
#    }
#  ]
#
#  tags = {
#    Environment = "Test"
#  }
#}