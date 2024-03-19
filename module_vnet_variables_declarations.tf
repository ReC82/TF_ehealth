variable "subnet_names" {
  type        = list(string)
  description = "List of subnets names"
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnets"
  type        = list(string)
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "pub_ip" {
  type = list(bool)
}
