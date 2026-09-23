variable "web_server_port" {
  description = "Puertos externos para el frontend"
  type        = map(number)
}

variable "api_server_port" {
  description = "Puertos externos para el backend"
  type        = map(number)
}

variable "db_server_port" {
  description = "Puertos externos para PostgreSQL"
  type        = map(number)
}