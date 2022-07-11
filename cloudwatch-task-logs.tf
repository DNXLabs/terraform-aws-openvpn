resource "aws_cloudwatch_log_group" "default" {
  name = "ecs-openvpn-${var.name}"

  retention_in_days = var.cw_retention_period
}