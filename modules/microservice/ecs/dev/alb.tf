
resource "aws_lb" "alb" {
  name               = "${var.app_name}-dev"
  internal           = true # Internal in dev
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  # Private subnets in dev
  subnets            = data.terraform_remote_state.networking-dev-us-east-1.outputs.private_subnets
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

  tags = local.tags
}

resource "aws_lb_target_group" "target_group" {
  name     = "${var.app_name}-dev"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.networking-dev-us-east-1.outputs.vpc_id

  tags = local.tags
}