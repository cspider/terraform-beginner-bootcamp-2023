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
    UserUuid   = var.user_uuid
    Environment = "Dev"
  }

}


