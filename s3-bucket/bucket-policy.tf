# BUCKET POLICY FOR GET OBJECT
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.unique_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.unique_bucket.arn}/*"
      }
    ]
  })
}

# OUTPUT URL OF UPLOADED FILE
output "file_url" {
  value = "https://${aws_s3_bucket.unique_bucket.bucket}.s3.amazonaws.com/${aws_s3_object.uploaded_file.key}"
}