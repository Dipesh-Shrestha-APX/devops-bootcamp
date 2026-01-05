resource "aws_instance" "instance_1" {
  ami           = var.ami_id
  instance_type = var.instance_Type

  tags = {
    Name = var.instance_Name
  }
}