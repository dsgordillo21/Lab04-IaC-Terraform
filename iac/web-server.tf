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

  upload {
    content = <<-EOT
      <!DOCTYPE html>
      <html lang="es">
      <head>
        <meta charset="UTF-8">
        <title>DEV</title>
      </head>
      <body>
        <h1>Frontend DEV</h1>
      </body>
      </html>
    EOT

    file = "/usr/share/nginx/html/index.html"
  }
}

resource "docker_container" "web_qa" {
  name  = "web-qa"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_server_port["qa"]
  }

  upload {
    content = <<-EOT
      <!DOCTYPE html>
      <html lang="es">
      <head>
        <meta charset="UTF-8">
        <title>QA</title>
      </head>
      <body>
        <h1>Frontend QA</h1>
      </body>
      </html>
    EOT

    file = "/usr/share/nginx/html/index.html"
  }
}