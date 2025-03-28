# S3 BUCKET WITH UNIQUE NAME
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "unique_bucket" {
  bucket = "my-unique-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name  = "Unique S3 Bucket"

  }
}
# DISABLE BLOCK PUBLIC ACCESS
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.unique_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ENABLE VERSIONING
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.unique_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

