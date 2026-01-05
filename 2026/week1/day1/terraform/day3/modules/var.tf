variable "bucket_name" {
  type        = string
  description = "Name of s3 bucket"
}

variable "force_destroy" {
  type    = bool
  default = false
}
