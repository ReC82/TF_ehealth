output "public_ips" {
  description = "Display the public ips"
  value       = module.main_app_vnet.public_ip_address
}

output "db_private_key" {
  description = "private key for db"
  value       = module.main_app_database.db_private_key
  sensitive   = true
}