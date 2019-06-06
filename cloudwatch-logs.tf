resource "aws_cloudwatch_log_group" "default" {
  name = "ecs-openvpn-${var.name}"
}
