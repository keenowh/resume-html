provider "aws" {

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token

  region = "us-east-1"
}

resource "aws_s3_bucket" "b1" {

  bucket = "s3-resume-bucket-lab"

  acl = "private" # or can be "public-read"

  tags = {

    Name = "My bucket"

    Environment = "Dev"

  }
  force_destroy = true


}

# Upload an object
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.b1.id

  key = "Resume.pdf"

  acl = "public-read" # or can be "public-read"

  source       = "Resume.pdf"
  content_type = "application/pdf"
  etag         = filemd5("Resume.pdf")
  storage_class = "ONEZONE_IA"
}