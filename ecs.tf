resource "aws_ecs_cluster" "ecs" {

  depends_on = [aws_autoscaling_group.ecs, aws_ecs_capacity_provider.ecs_capacity_provider]
  name       = var.name

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  provisioner "local-exec" {
    when    = destroy
    command = <<-EOT
    aws autoscaling update-auto-scaling-group --auto-scaling-group-name ecs-${self.name} --min-size 0 --desired-capacity 0
EOT
  }

}

resource "aws_ecs_cluster_capacity_providers" "ecs" {
  cluster_name       = aws_ecs_cluster.ecs.name
  capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]
}
