output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}

output "ips_file_path" {
  value = "${aws_s3_bucket.this.bucket}/${aws_s3_object.this.key}"
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}

output "aws_instance_id" {
  value = data.aws_ami.ubuntu.id
}

output "extensions" {
  value = local.file_extensions
}

output "extensions_upper" {
  value = local.file_extensions_upper
}

output "instance_arns" {
  value = [for k, v in aws_instance.this : v.arn]
}

output "instance_names" {
  value = { for k, v in aws_instance.this : k => v.tags.Name }
}

output "private_ips" {
  value = [for o in local.ips : o.private]
}

output "public_ips" {
  value = local.ips[*].public
}

output "bucket-name" {
  value = module.bucket.name
}

output "bucket-arn" {
  value = module.bucket.arn
}

output "bucket-website-name" {
  value = module.website.name
}

output "bucket-website-url" {
  value = module.website.website
}

output "bucket-website-arn" {
  value = module.website.arn
}

output "bucket-website-files" {
  value = module.website.files
}