resource "aws_s3_bucket" "wd-bucket-storage-back" {
  bucket = "data-management-flash"
}

resource "aws_s3_bucket_ownership_controls" "wd-bucket-controls" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "wd-bucket-storage-back" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "wd-bucket-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.wd-bucket-controls,
    aws_s3_bucket_public_access_block.wd-bucket-storage-back
  ]

  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  acl = "public-read"
}