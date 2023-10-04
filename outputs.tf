output "bucket_name" {
    description = "name of the bucket for our static webseite"
    // Get the output value from child module
    value = module.terrahouse_aws.website_bucket_name
}

 output "website_endpoint" {
    description = "S3 Static Website hosting endpoint"
    value = module.terrahouse_aws.website_endpoint
 }

 output "cloudfront_url" {
    description = "CloudFront Distribution Domain name"
    value = module.terrahouse_aws.cloudfront_url
 }