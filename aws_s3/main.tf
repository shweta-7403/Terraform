terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = "myprofile"
}
resource "aws_s3_bucket" "bucket" {
    bucket = "mys3bucket12345"
}
resource "aws_s3_bucket_object" "myobj" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "data/file.txt"  
  source = "./file.txt"
}
