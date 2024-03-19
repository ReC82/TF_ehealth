# GLOBALS

variable "app_ressource_group_name" {
    description = "App Resource Group Name"
}

variable "app_location" {
    description = "App Location"
}

# MODULE SPECIFIC

variable "db_pass" {
    description = "mysql root pwd"
    sensitive = true
}

variable "db_root_user" {
    description = "mysql root user"
    sensitive = true
}   

variable "db_srv_name" {
    description = "DB Server Name"
}

variable "db_srv_size" {
    default = "Standard_DS1_v2"
}

variable "db_srv_disk_name" {
    default = "DISK_DB_EHEALTH"
}

variable "db_srv_disk_storage_account_type" {
    default = "Premium_LRS"
}

variable "db_srv_distrib" {
    default = "UbuntuServer"
}

variable "db_srv_distrib_sku" {
    default = "18.04-LTS"
}

variable "db_srv_distrib_version" {
    default = "latest"
}

variable "db_nic_id" {
    type = list(string)
    description = "NIC ID"
}

variable "dis_pwd_auth" {
    description = "Disable password authentication (default : false)"
    default = false
}

variable "db_disk_caching" {
    description = "Define type of disk access (default : ReadWrite)"
    default = "ReadWrite"
}

variable db_src_img_ref_publisher {
    description = "publisher of the image used"
    default = "Canonical"
}

variable "db_tags" {
    type = map(string)
    default = {
      "env" = "prod"
    }
}