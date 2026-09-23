resource "docker_image" "node" {
  name         = "node:20-alpine"
  keep_locally = true
}

resource "docker_container" "api_dev" {
  name  = "api-dev"
  image = docker_image.node.image_id

  ports {
    internal = 3000
    external = var.api_server_port["dev"]
  }

  upload {
    content = <<-EOT
      const http = require("http");

      const server = http.createServer((req, res) => {
        res.writeHead(200, { "Content-Type": "application/json" });
        res.end(JSON.stringify({
          message: "API DEV funcionando"
        }));
      });

      server.listen(3000, "0.0.0.0");
    EOT

    file = "/app/index.js"
  }

  command = ["node", "/app/index.js"]
}

resource "docker_container" "api_qa" {
  name  = "api-qa"
  image = docker_image.node.image_id

  ports {
    internal = 3000
    external = var.api_server_port["qa"]
  }

  upload {
    content = <<-EOT
      const http = require("http");

      const server = http.createServer((req, res) => {
        res.writeHead(200, { "Content-Type": "application/json" });
        res.end(JSON.stringify({
          message: "API QA funcionando"
        }));
      });

      server.listen(3000, "0.0.0.0");
    EOT

    file = "/app/index.js"
  }

  command = ["node", "/app/index.js"]
}