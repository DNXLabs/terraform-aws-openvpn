resource "aws_s3_bucket" "vpn" {
  bucket_prefix = "openvpn-${var.name}-"
  acl           = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
}