####################
# Web Storage Account
####################
resource "azurerm_storage_account" "storacc_api_linux" {
  name                     = "api${random_id.randomId.hex}"
  location                 = var.app_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  resource_group_name      = var.app_ressource_group_name
  tags = {
    env = "prod"
  }
}

resource "random_id" "randomId" {
  keepers = {
    resource_group = var.app_location
  }
  byte_length = 8
}

###########################
# API VM
###########################

resource "azurerm_linux_virtual_machine" "ehealth_api_srv" {
  name                            = var.api_srv_name
  location                        = var.app_location
  network_interface_ids           = var.api_nic_id
  admin_username                  = var.api_root_user
  disable_password_authentication = var.api_dis_pwd_auth
  admin_password = var.api_pass
  resource_group_name             = var.app_ressource_group_name
  size                            = var.api_srv_size
  os_disk {
    name                 = var.api_srv_disk_name
    caching              = var.api_disk_caching
    storage_account_type = var.api_srv_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.api_src_img_ref_publisher
    offer     = var.api_srv_distrib
    sku       = var.api_srv_distrib_sku
    version   = var.api_srv_distrib_version
  }

  computer_name = var.api_srv_name

  admin_ssh_key {
    username   = var.api_root_user
    public_key = tls_private_key.ssh_ehealth.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storacc_api_linux.primary_blob_endpoint
  }

  tags = var.api_tags

}

