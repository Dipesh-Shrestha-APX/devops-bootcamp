variable "ami_id" {
  type        = string
  description = "Ami ID (OS) for the instance"
}
variable "instance_Type" {
  type        = string
  description = "Type of CPU to provision"
}
variable "instance_Name" {
  type        = string
  description = "Tag Name for your instance"
}
variable "bucket_name" {
  type        = string
  description = "Name of s3 bucket"
}

variable "force_destroy" {
  type    = bool
  default = false
}
