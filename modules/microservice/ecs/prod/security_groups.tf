resource "aws_security_group" "app" {
  name        = "${var.app_name}_prod_internal"
  description = "Allow all internal traffic"
  vpc_id      = data.terraform_remote_state.networking-prod-us-east-1.outputs.vpc_id

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
  name        = "${var.app_name}_prod_external"
  description = "Allow all external traffic and designed to be attached to the ALB"
  vpc_id      = data.terraform_remote_state.networking-prod-us-east-1.outputs.vpc_id

  # Egress managed by external rule to avoid circular dependency

  # ALB terminates TLS, to take ingress on 443
  ingress {
    description      = "internal traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.tags
}

resource "aws_security_group_rule" "external_egress" {
  type              = "egress"
  from_port        = 3000
  to_port          = 3000
  protocol         = "tcp"
  source_security_group_id = aws_security_group.app.id
  security_group_id = aws_security_group.lb.id
}