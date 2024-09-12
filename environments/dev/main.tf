resource "aws_s3_bucket" "wd-bucket-storage-back" {
  bucket = "data-management-flash"

}

resource "aws_s3_bucket_public_access_block" "wd-bucket-storage-back" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "wd-bucket-storage-back" {
  bucket = aws_s3_bucket.wd-bucket-storage-back.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal ={
          AWS = "*"
        }
        Action = [
          "s3:*"
        ]
        Resource = [
          "arn:aws:s3:::data-management-flash/*",
        ]
      }
    ]
  })
}