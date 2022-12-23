# Public Cloud Configuration
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "admin"
  secret_key                  = "admin"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
    lambda   = "http://localhost:4566"
    kinesis  = "http://localhost:4566"
    sqs      = "http://localhost:4566"
  }
}


# Create Bucket
resource "aws_s3_bucket" "s3bucket" {
  bucket = "testbucket"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_dynamodb_table" "dogs" {
  name           = "dogs"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "ID"

  attribute {
    name = "ID"
    type = "S"
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                        = "murali-example-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}



# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "test.txt"
  acl    = "public-read"
  source = "ReadMe.txt"
}