resource "aws_lb" "ecs" {
  load_balancer_type = "network"
  internal           = false
  name               = "ecs-${var.name}"
  subnets            = var.public_subnet_ids

  idle_timeout = 400

  dynamic "access_logs" {
    for_each = compact([var.lb_access_logs_bucket])

    content {
      bucket  = var.lb_access_logs_bucket
      prefix  = var.lb_access_logs_prefix
      enabled = true
    }
  }

  tags = {
    Name = "ecs-${var.name}"
  }
}

resource "aws_lb_listener" "ecs_default" {
  load_balancer_arn = aws_lb.ecs.arn
  port              = "1194"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_default.arn
  }
}

# Generate a random string to add it to the name of the Target Group
resource "random_string" "alb_prefix" {
  length  = 4
  upper   = false
  special = false
}

resource "aws_lb_target_group" "ecs_default" {
  name                 = substr("ecs-${var.name}-${random_string.alb_prefix.result}", 0, 32)
  port                 = 1194
  protocol             = "TCP"
  vpc_id               = var.vpc_id
  deregistration_delay = 10
  target_type          = "instance"

  health_check {
    protocol = "TCP"
    port     = 1194
    interval = 30
  }

  stickiness {
    enabled = false
    type    = "source_ip"
  }

  lifecycle {
    create_before_destroy = true
  }
}
