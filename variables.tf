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