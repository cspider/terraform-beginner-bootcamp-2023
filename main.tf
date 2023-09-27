terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

     aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  provider = random
  lower = true
  upper = false
  numeric = true
  length           = 32
  special          = false
  override_special = ""
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = random_string.bucket_name.result
  provider = aws
  tags = {
    Name        = "My first bucket"
    Environment = "Devte"
  }
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
