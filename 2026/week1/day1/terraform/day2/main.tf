locals {
  env       = var.environment
  upper     = upper(local.env)
  base_path = "${path.module}/${local.upper}/"
}
resource "local_file" "file1" {
  filename = "${local.base_path}/${var.environment}.txt"
  content  = <<EOL
    environment = ${local.env}
    port = 1000
    EOL
}
resource "local_file" "file2" {
  filename = "${local.base_path}/file2.txt"
  content  = <<EOL
    environment = ${local.env}
    port = 1000
    EOL
}