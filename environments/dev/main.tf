terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
}

resource "aws_s3_bucket" "annysahbucket" {
  bucket = "annysah-terraform-practice"
}

resource "aws_s3_bucket" "testbucket" {
  bucket = "annysah-terraform-test"
}