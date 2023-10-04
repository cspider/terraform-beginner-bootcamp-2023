output "generated_user_uuid" {
   value = var.user_uuid
}

output "bucket_name_id" {
    value = var.bucket_name
}

output "website_bucket_name" {
  value = aws_s3_bucket.website_bucket.arn
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}