terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  override_special = ""
}

output "bucket_name_id" {
    value = random_string.bucket_name.id
}

output "bucket_name_result" {
    value = random_string.bucket_name.result
}
