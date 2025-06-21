provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"
}

resource "aws_s3_bucket" "b1" {
  bucket = "s3-resume-bucket-lab"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  force_destroy = true
}

# Disable block public access settings
resource "aws_s3_bucket_public_access_block" "b1" {
  bucket = aws_s3_bucket.b1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket policy to make Resume.pdf publicly accessible
resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.b1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.b1.arn}/Resume.pdf"
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.b1]
}


# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b1.id
  key    = "Resume.pdf"

  source        = "Resume.pdf"
  content_type  = "application/pdf"
  storage_class = "ONEZONE_IA"
  etag          = "${filemd5("Resume.pdf")}-${timestamp()}"
}