resource "local_file" "dipesh" {
  content  = "This is the content for the real_dipesh.txt that is actual file name whereas the dipesh is the name that terraform will use to reference the actual file created here"
  filename = "${path.module}/real_dipesh.txt"
}

resource "local_sensitive_file" "dipesh2" {
  content  = "This is the content for the sensitive file out here"
  filename = "${path.module}/real_dipesh2.txt"
}
