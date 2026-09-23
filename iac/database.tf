resource "docker_image" "postgres" {
  name         = "postgres:17"
  keep_locally = true
}

resource "docker_container" "db_dev" {
  name  = "bd-dev"
  image = docker_image.postgres.image_id

  ports {
    internal = 5432
    external = var.db_server_port["dev"]
  }

  env = [
    "POSTGRES_DB=appdb",
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=postgres"
  ]
}

resource "docker_container" "db_qa" {
  name  = "bd-qa"
  image = docker_image.postgres.image_id

  ports {
    internal = 5432
    external = var.db_server_port["qa"]
  }

  env = [
    "POSTGRES_DB=appdb",
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=postgres"
  ]
}