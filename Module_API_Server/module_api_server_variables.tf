# GLOBALS

variable "app_ressource_group_name" {
    description = "App Resource Group Name"
}

variable "app_location" {
    description = "App Location"
}

# MODULE SPECIFIC

variable "api_pass" {
    description = "mysql root pwd"
    sensitive = true
}

variable "api_root_user" {
    description = "mysql root user"
    sensitive = true
}   

variable "api_srv_name" {
    description = "DB Server Name"
}

variable "api_srv_size" {
    default = "Standard_DS1_v2"
}

variable "api_srv_disk_name" {
    description = "Disk name for API"
}

variable "api_srv_disk_storage_account_type" {
    default = "Premium_LRS"
}

variable "api_srv_distrib" {
    default = "UbuntuServer"
}

variable "api_srv_distrib_sku" {
    default = "18.04-LTS"
}

variable "api_srv_distrib_version" {
    default = "latest"
}

variable "api_nic_id" {
    type = list(string)
    description = "NIC ID"
}

variable "api_dis_pwd_auth" {
    description = "Disable password authentication (default : false)"
    default = false
}

variable "api_disk_caching" {
    description = "Define type of disk access (default : ReadWrite)"
    default = "ReadWrite"
}

variable api_src_img_ref_publisher {
    description = "publisher of the image used"
    default = "Canonical"
}

variable "api_tags" {
    type = map(string)
    default = {
      "env" = "prod"
    }
}