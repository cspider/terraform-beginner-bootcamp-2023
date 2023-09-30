output "generated_user_uuid" {
   value = var.user_uuid
}

output "bucket_name_id" {
    value = var.bucket_name
}

output "my_s3_bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.arn
}
