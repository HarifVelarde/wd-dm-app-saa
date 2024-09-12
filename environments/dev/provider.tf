terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket="backend-bucket-tf-wd"
    region="us-west-1"
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
}