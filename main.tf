provider "aws" {

  access_key = "ASIAVOBIMUHNCJXBB375"
  secret_key = "tdtejXRLlYzjgvBgj+PWiA4UbIkmhNibLGqBedUr"

  token = "FwoGZXIvYXdzEPj//////////wEaDPWOh8eeo+Zy731xwSLHAQyt5R/MuxNN7CxRIcJKbJoeAo8muqcQn/oM1cBv72wK0tyQ0URGlD476ceDP8knL2RfqE3tK2DSPG9m1iWhV2KwqqvBJcavJ6xsKKIWSQ9zXX7PyFLsSynMDNxcRxTJbvkfYM+lBfGgo+3eql3qKGWvX0ObjNkyOydq9gBhC1At10BSAbQxvylLSyTjof9hxNEiV370WRO4jy2EA70B7gjGx7XecY6PSwP+7S/CljGXXCNmOpOJsoeNy7ou5eDpR4LWAGmRf8gog5yajAYyLUFaRlS1vygDJIOvUX/qygkZLroGrsevGiNb9TvKdYY3bEmyWVSqcSMS20GpgQ=="

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
}