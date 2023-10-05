variable "user_uuid" {
  type        = string
  description = "User UUID"

  validation {
    condition     = length(var.user_uuid) == 36 && can(regex("^[0-9a-fA-F-]+$", var.user_uuid))
    error_message = "Invalid user_uuid. It should be a 3-character string containing only hexadecimal characters and hyphens."
  }
}

variable "bucket_name" {
  type        = string
  description = "bucket name validates the string "
   default     = "my-mind-blowoing-bucket" # You can provide a default value or leave it empty

   validation {
     condition     = can(regex("^[a-zA-Z0-9.-]+$", var.bucket_name))
     error_message = "Invalid bucket name. It must consist of lowercase letters, numbers, hyphens, and periods only."
   }
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string
   validation {
     condition = fileexists("${var.index_html_filepath}")
     error_message = "The provided path for index.html does not exist"
   }
}


variable "error_html_filepath" {
  description = "The file path for error.html"
  type        = string
   validation {
     condition = fileexists("${var.error_html_filepath}")
     error_message = "The provided path for error.html does not exist"
   }
}

variable "assets_path" {
  description = "Path to the assets for terrahouse_aws module"
  type = string
}

variable "content_version" {
  description = "Content version for html files"
  type = number
}

