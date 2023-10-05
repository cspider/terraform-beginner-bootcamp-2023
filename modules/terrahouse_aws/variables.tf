variable "user_uuid" {
  type        = string
}

variable "bucket_name" {
  type        = string
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type        = string
}

variable "assets_path" {
  description = "Path to the assets for terrahouse_aws module"
  type = string
}

variable "content_version" {
  description = "Content version for html files"
  type = number
}