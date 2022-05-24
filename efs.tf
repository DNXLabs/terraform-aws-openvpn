resource "aws_efs_file_system" "ecs" {
  creation_token = "ecs-${var.name}"
  encrypted      = true
  kms_key_id     = var.kms_key_efs_arn != "" ? var.kms_key_efs_arn : null

  throughput_mode                 = var.throughput_mode
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps

  tags = {
    Name   = "ecs-${var.name}"
    Backup = var.backup
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_efs_mount_target" "ecs" {
  count          = length(var.secure_subnet_ids)
  file_system_id = aws_efs_file_system.ecs.id
  subnet_id      = element(var.secure_subnet_ids, count.index)

  security_groups = [
    aws_security_group.efs.id
  ]

  lifecycle {
    ignore_changes = [subnet_id]
  }
}

resource "aws_security_group" "efs" {
  name        = "ecs-${var.name}-efs"
  description = "for EFS to talk to ECS cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ecs-efs-${var.name}"
  }
}

resource "aws_security_group_rule" "nfs_from_ecs_to_efs" {
  description              = "ECS to EFS"
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs.id
  source_security_group_id = aws_security_group.ecs_nodes.id
}