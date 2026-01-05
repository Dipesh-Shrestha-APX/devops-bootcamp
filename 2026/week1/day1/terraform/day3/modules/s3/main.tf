resource "aws_s3_bucket" "mybucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}
