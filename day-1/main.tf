resource "random_string" "name" {
  length  = 8
  upper   = false
  special = false
}

resource "local_file" "example" {
  filename = "${path.module}/hello_world.txt"
   content  = "Random String: ${random_string.name.result}"
}
