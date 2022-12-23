# Public Cloud Configuration
provider "aws" {
  region                      = "%AWS_REGION%"
  access_key                  = "%AWS_ACCESS_KEY%"
  secret_key                  = "%AWS_SECRET_KEY%"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  endpoints {
    s3 = "%aws_endpoint%"
  }
}

# Create Bucket
resource "aws_s3_bucket" "b" {
  bucket = "${S3BucketName}"
  acl    = "public-read"
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "test.txt"
  acl    = "public-read"
  source = "ReadMe.txt"
}