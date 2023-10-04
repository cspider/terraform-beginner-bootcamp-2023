terraform {

# backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "Susanta-Home"

#     workspaces {
#       name = "terraform-beginner-bootcamp-2023"
#     }
#   }

  # cloud {
  #   organization = "Susanta-Home"
  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    } 
  }
}



module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
}


 