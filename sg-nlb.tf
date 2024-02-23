resource "aws_security_group" "nlb" {
  name        = "ecs-${var.name}-nlb"
  description = "SG for network load balancer"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ecs-${var.name}-nlb"
  }
}

resource "aws_security_group_rule" "nlb_from_internet" {
  description       = "Traffic from Internet"
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "-1"
  security_group_id = aws_security_group.nlb.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "nlb_to_internet" {
  description       = "Traffic to internet"
  type              = "egress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "-1"
  security_group_id = aws_security_group.nlb.id
  cidr_blocks       = ["0.0.0.0/0"]
}

