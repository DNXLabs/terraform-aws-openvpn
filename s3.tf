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

resource "aws_s3_bucket_public_access_block" "vpn" {
  bucket = aws_s3_bucket.vpn.id

  block_public_acls   = true
  block_public_policy = true
}