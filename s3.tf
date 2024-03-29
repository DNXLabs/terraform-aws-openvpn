resource "aws_s3_bucket" "vpn" {
  bucket_prefix = "openvpn-${var.name}-"
}

resource "aws_s3_bucket_acl" "vpn" {
  depends_on = [aws_s3_bucket_ownership_controls.vpn]

  bucket = aws_s3_bucket.vpn.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "vpn" {
  bucket = aws_s3_bucket.vpn.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "vpn" {
  count  = var.s3_bucket_policy != "" ? 1 : 0
  bucket = aws_s3_bucket.vpn.id
  policy = var.s3_bucket_policy
}

resource "aws_s3_bucket_public_access_block" "vpn" {
  bucket = aws_s3_bucket.vpn.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "vpn" {
  bucket = aws_s3_bucket.vpn.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_s3_arn != "" ? var.kms_key_s3_arn : null
      sse_algorithm     = "aws:kms"
    }
  }
}
