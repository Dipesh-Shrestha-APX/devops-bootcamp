#OUTPUTS
output "instance_id" {
  value = module.ec2.instance_id
}
output "instance_ip" {
  value = module.ec2.instance_ip
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}
