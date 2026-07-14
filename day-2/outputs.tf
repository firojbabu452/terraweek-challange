output "container_name" {
  value = docker_container.nginx.name
}

output "container_id" {
  value = docker_container.nginx.id
}

output "image_name" {
  value = docker_image.nginx.name
}

output "url" {
  value = "http://localhost:${var.external_port}"
}