output "bucket_name" {
    description = "name of the bucket for our static webseite"
    // Get the output value from child module
    value = module.terrahouse_aws.website_bucket_name
}