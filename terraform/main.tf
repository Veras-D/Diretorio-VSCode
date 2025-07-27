provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name        = "My first bucket from terraform"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

resource "random_id" "bucket_id" {
  byte_length = var.bucket_id_byte_length
}

resource "aws_instance" "first-ec2-terraform" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}