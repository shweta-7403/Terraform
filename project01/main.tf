terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "myprofile"
}
resource "random_id" "randoms" {
  byte_length =  8 
}
resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-${random_id.randoms.hex}"
}
resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.mybucket.arn}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  }

resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.mybucket.bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
  }
output "name" {
  value = aws_s3_bucket_website_configuration.mybucket.website_endpoint 
}