resource "aws_s3_bucket" "annysahbucket" {
  bucket = "annysah-terraform-practice"
}

resource "aws_s3_bucket" "testbucket" {
  bucket = "annysah-terraform-test1"
}

resource "aws_s3_bucket" "wd-bucket" {
  bucket = "data-management"
}