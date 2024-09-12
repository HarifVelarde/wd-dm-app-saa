resource "aws_s3_bucket" "wd-bucket-storage-back" {
  bucket = "data-management-flash"
}

resource "aws_s3_bucket_public_access_block" "wd-bucket-storage-back" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "wd-bucket-storage-back" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "WDBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::data-management-flash/*",
    }
  ]
}
POLICY
}