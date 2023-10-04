resource "aws_ecs_cluster" "ecs" {

  depends_on = [aws_autoscaling_group.ecs, aws_ecs_capacity_provider.ecs_capacity_provider]
  name       = var.name

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

}

