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

module "bucket" {
  source = "./s3_module"
  name   = "s3_bucket_module-${random_id.bucket_id.hex}"

  versioning = {
    enabled = "Enabled"
  }
}

module "website" {
  source = "./s3_module"
  name   = "s3_bucker_module_website-${random_id.bucket_id.hex}}"
  acl    = "public-read"
  files  = "${path.root}/website"
  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${random_id.bucket_id.hex}/*"
            ]
        }
    ]
}
EOT

  website = {
    suffix = "index.html"
    key    = "error.html"
  }
}