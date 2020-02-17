resource "aws_ecs_service" "default" {
  name            = "openvpn-${var.name}"
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.default.arn
  desired_count   = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}
