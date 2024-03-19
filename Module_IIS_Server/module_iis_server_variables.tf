# GLOBALS

variable "app_ressource_group_name" {
    description = "App Resource Group Name"
}

variable "app_location" {
    description = "App Location"
}

# MODULE SPECIFIC

variable "iis_server_name" {
    type = string
    description = "Name of the server"
}

variable "iis_server_size" {
    type = string
    description = "Server Size - Azure Format"
}

variable "iis_admin_username" {
    type = string
    description = "Main Admin User"
    sensitive = true
}

variable "iis_admin_password" {
    type = string
    description = "Admin user's password"
    sensitive = true
}

variable "iis_nic_id" {
    type = list(string)  
    description = "IIS server Network ID(s)"
}

/*
variable "iis_disk_access_caching" {
    type = string
}

variable "iis_storage_type" {
    type = string
}*/