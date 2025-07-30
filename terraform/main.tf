terraform {
  backend "s3" {
    bucket = "tfstate-664418958633"
    key    = "./terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_acl" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_remote-state" {
  bucket = aws_s3_bucket.remote-state.id

  versioning_configuration {
    status = "Enabled"
  }
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
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = var.instance_tags
}