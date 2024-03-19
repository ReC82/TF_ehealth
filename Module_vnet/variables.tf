variable "app_ressource_group_name" {
  description = "Name of the Azure resource group"
}

variable "location" {
  description = "Location for all Azure resources"
  default     = "centralus"
}

variable "pub_ip" {
  type = list(bool)  
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet"
  type        = list(string)
}

variable "subnet_names" {
  description = "A list of subnet names inside the vNet"
  type        = list(string)
}
