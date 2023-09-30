output "generated_user_uuid" {
   value = var.user_uuid
}

output "bucket_name_id" {
    value = var.bucket_name
}

output "website_bucket_name" {
  value = aws_s3_bucket.website_bucket.arn
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.website_bucket_config.website_endpoint
}