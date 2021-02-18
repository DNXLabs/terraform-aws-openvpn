resource "aws_ecs_service" "default" {
  name            = "default"
  cluster         = var.name
  task_definition = aws_ecs_task_definition.default.arn
  desired_count   = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_default.arn
    container_name   = var.name
    container_port   = 1194
  }
}