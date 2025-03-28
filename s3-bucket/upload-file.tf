# UPLOAD FILE TO S3 BUCKET
resource "aws_s3_object" "uploaded_file" {
  bucket = aws_s3_bucket.unique_bucket.bucket
  key    = "first.jpeg"                         # file name
  source = "/home/shweta/Desktop/first.jpeg"      # Local file path         
  content_type = "image/jpeg"
}