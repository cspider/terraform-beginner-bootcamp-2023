variable "user_uuid" {
  type        = string
  description = "User UUID"

  validation {
    condition     = length(var.user_uuid) == 36 && can(regex("^[0-9a-fA-F-]+$", var.user_uuid))
    error_message = "Invalid user_uuid. It should be a 3-character string containing only hexadecimal characters and hyphens."
  }
}