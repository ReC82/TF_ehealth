# SERVER_NAMES
# VNET (10.0.0.0/16)
# SUBNETS : NAMES, IP_RANGES (10.0.1-2-3 / 24)

variable "app_location" {
  default = "centralus"
}

variable "app_ressource_group_name" {
  description = "Resource group name"
}

/*

variable "ehealth_vnet_ip_range" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "ehealth_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "ehealth_subnets_names" {
  type    = list(string)
  default = ["sub-app", "sub-api", "sub-db"]
}
*/