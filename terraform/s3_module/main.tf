resource "aws_s3_bucket" "this" {
  bucket = var.name

  tags = var.tags
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id

  acl = var.acl
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.policy != null ? 1 : 0
  bucket = aws_s3_bucket.this.id

  policy = var.policy
}

resource "aws_s3_bucket_website_configuration" "this" {
  count  = var.website != null ? 1 : 0
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = lookup(var.website, "suffix", "index.html")
  }

  error_document {
    key = lookup(var.website, "key", "error.html")
  }

  dynamic "redirect_all_requests_to" {
    for_each = var.website.redirect_all_requests_to != null ? [1] : []

    content {
      host_name = var.website.redirect_all_requests_to
    }
  }

  routing_rules = var.website.routing_rules
}

resource "aws_s3_bucket_versioning" "this" {
  count  = var.versioning != null ? 1 : 0
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status     = lookup(var.versioning, "enabled", "Disabled")
    mfa_delete = lookup(var.versioning, "mfa_delete", "Disabled")
  }
}

module "objects" {
  source = "./s3_object"

  for_each = var.files != "" ? fileset(var.files, "**") : []

  bucket = aws_s3_bucket.this.bucket
  key    = "${var.key_prefix}/${each.value}"
  src    = "${var.files}/${each.value}"
}