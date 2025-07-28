provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "this" {
  bucket = "my-tf-bucket-${random_id.bucket_id.hex}"

  tags = local.common_tags
}

resource "aws_s3_object" "this" {
  bucket  = aws_s3_bucket.this.bucket
  key     = "config/ips.json"
  content = jsonencode({ ips = ["192.168.0.1", "192.168.0.2"] })

  tags = local.common_tags
}

resource "random_id" "bucket_id" {
  byte_length = var.bucket_id_byte_length
}

resource "aws_instance" "first-ec2-terraform" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}