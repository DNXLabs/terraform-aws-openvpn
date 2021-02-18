# resource "aws_security_group" "alb" {
#   name        = "ecs-${var.name}-lb"
#   description = "SG for ECS ALB"
#   vpc_id      = var.vpc_id

#   tags = {
#     Name = "ecs-${var.name}-lb"
#   }
# }

# resource "aws_security_group_rule" "openvpn_from_world_to_alb" {
#   description       = "OpenVPN to ECS ALB"
#   type              = "ingress"
#   from_port         = 1194
#   to_port           = 1194
#   protocol          = "udp"
#   security_group_id = aws_security_group.alb.id
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "to_ecs_nodes" {
#   description              = "Traffic to ECS Nodes"
#   type                     = "egress"
#   from_port                = 0
#   to_port                  = 0
#   protocol                 = "-1"
#   security_group_id        = aws_security_group.alb.id
#   source_security_group_id = aws_security_group.ecs_nodes.id
# }