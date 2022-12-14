resource "aws_security_group" "app" {
  name        = "${var.app_name}_dev"
  description = "Allow all internal traffic"
  vpc_id      = data.terraform_remote_state.networking-dev-us-east-1.outputs.vpc_id

  # Allow egress to anything
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Allow ingress from ALB. App serves non-tls inside the VPC.
  ingress {
    description      = "internal traffic"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    security_groups = [ "${aws_security_group.lb.id}" ]
  }

  tags = local.tags
}

resource "aws_security_group" "lb" {
  name        = "${var.app_name}_dev_lb"
  description = "Allow all external traffic and designed to be attached to the ALB"
  vpc_id      = data.terraform_remote_state.networking-dev-us-east-1.outputs.vpc_id

  # Egress managed by external rule to avoid circular dependency

  # Only accept ingress from internal sources in dev
  ingress {
    description      = "internal traffic"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    security_groups = [ "${data.terraform_remote_state.networking-dev-us-east-1.outputs.internal_security_group_id}" ]
  }

  tags = local.tags
}

resource "aws_security_group_rule" "external_egress" {
  type              = "egress"
  from_port        = 3000
  to_port          = 3000
  protocol         = "tcp"
  source_security_group_id = aws_security_group.app.id
  security_group_id = aws_security_group.app.id
}