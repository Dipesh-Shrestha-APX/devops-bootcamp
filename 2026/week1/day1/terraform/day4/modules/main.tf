module "s3" {
  source        = "./s3"
  bucket_name   = var.bucket_name
  force_destroy = true
}

# Call EC2 module
module "ec2" {
  source        = "./ec2"
  instance_Type = var.instance_Type
  instance_Name = var.instance_Name
  ami_id        = var.ami_id
}

