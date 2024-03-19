# SERVER_NAMES
# VNET (10.0.0.0/16)
# SUBNETS : NAMES, IP_RANGES (10.0.1-2-3 / 24)


# Variable for resource_group
variable "nsg_rg_group_name" {
    type        = string
    description = "RG name in Azure"
}

variable "nsg_rg_location" {
    type        = string
    description = "RG location in Azure"
}

# Variable for network_security_group
variable "nsg_app_name" {
    type        = string
    description = " APP NSG Ehealth in Azure"
}

variable "nsg_api_name" {
    type        = string
    description = "API NSG Ehealth in Azure"
}

variable "nsg_db_name" {
    type        = string
    description = "DB NSG Ehealth in Azure"
}

variable "nsg_nic_app" {
    type = list(string)
    description = "Nic ID of the App Server"
}

variable "nsg_nic_api" {
    type = list(string)
    description = "Nic ID of the App Server"
}

variable "nsg_nic_db" {
    type = list(string)
    description = "Nic ID of the App Server"
}

# Variable environement
variable "nsg_tags" {
    type = map(string)
    default = {
      "env" = "prod"
    }
     description = "Environment name for resource group Eahlth"
}



