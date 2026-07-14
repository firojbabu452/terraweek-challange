resource "docker_image" "nginx" {
  name = var.container_config.image
}

resource "docker_container" "nginx" {

  name    = "${var.environment}-${var.container_name}"
  image   = docker_image.nginx.image_id
  restart = var.container_config.restart

  ports {
    internal = var.container_config.internal_port
    external = var.external_port
  }

  labels {
    label = "environment"
    value = var.environment
  }

  labels {
    label = "managed-by"
    value = "terraform"
  }

  labels {
    label = "instance-type"
    value = local.instance_type
  }
}