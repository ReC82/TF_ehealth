variable "iis_server_name" {
  type        = string
  description = "Name of the server"
}

variable "iis_server_size" {
  type        = string
  description = "Server Size - Azure Format"
}

variable "iis_admin_username" {
  type        = string
  description = "Main Admin User"
  sensitive   = true
}

variable "iis_admin_password" {
  type        = string
  description = "Admin user's password"
  sensitive   = true
}