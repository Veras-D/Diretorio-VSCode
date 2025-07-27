provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}