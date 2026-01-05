output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.instance_1.id
}
output "instance_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.instance_1.private_ip
}
