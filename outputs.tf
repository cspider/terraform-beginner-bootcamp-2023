output "generated_user_uuid" {
   value = var.user_uuid
 }

output "bucket_name_id" {
    value = random_string.bucket_name.id
}

output "bucket_name_result" {
    value = random_string.bucket_name.result
}

output "my_s3_bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.arn
}
