resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web_dev" {
  name  = "web-dev"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_server_port["dev"]
  }
}

resource "docker_container" "web_qa" {
  name  = "web-qa"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_server_port["qa"]
  }
}