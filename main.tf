terraform {

# backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "Susanta-Home"

#     workspaces {
#       name = "terraform-beginner-bootcamp-2023"
#     }
#   }

  cloud {
    organization = "Susanta-Home"
    workspaces {
      name = "terra-house-1"
    }
}

  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}


provider "aws" {
  # Configuration options
}



resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.bucket_name
  provider = aws
  tags = {
    Name        = "My first bucket"
    UserUuid   = var.user_uuid
    Environment = "Dev"
  }

}


