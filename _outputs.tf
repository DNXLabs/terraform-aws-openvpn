output "ecs_nodes_secgrp_id" {
  value = aws_security_group.ecs_nodes.id
}

output "s3_bucket_openvpn" {
  value = aws_s3_bucket.vpn.bucket
}