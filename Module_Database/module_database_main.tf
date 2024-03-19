# MYSQL
# SET ROOT PWD - NO REMOTE LOGIN
# SET DBUSER

####################
# Web Storage Account
####################
resource "azurerm_storage_account" "storacc_db_linux" {
  name                     = "db${random_id.randomId.hex}"
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
# DB VM
###########################

resource "azurerm_linux_virtual_machine" "ehealth_db_srv" {
  name                            = var.db_srv_name
  location                        = var.app_location
  network_interface_ids           = var.db_nic_id
  admin_username                  = var.db_root_user
  disable_password_authentication = var.dis_pwd_auth
  admin_password = var.db_pass
  resource_group_name             = var.app_ressource_group_name
  size                            = var.db_srv_size
  os_disk {
    name                 = var.db_srv_disk_name
    caching              = var.db_disk_caching
    storage_account_type = var.db_srv_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.db_src_img_ref_publisher
    offer     = var.db_srv_distrib
    sku       = var.db_srv_distrib_sku
    version   = var.db_srv_distrib_version
  }

  computer_name = var.db_srv_name

  admin_ssh_key {
    username   = var.db_root_user
    public_key = tls_private_key.ssh_ehealth.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storacc_db_linux.primary_blob_endpoint
  }

  tags = var.db_tags

  //depends_on = [azurerm_resource_group.rg_ehealth, azurerm_network_interface.nic_db, azurerm_storage_account.storacc_db_linux]
}

