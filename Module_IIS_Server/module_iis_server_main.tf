resource "azurerm_windows_virtual_machine" "vm-iis-server" {
  name                = var.iis_server_name
  resource_group_name = var.app_ressource_group_name
  location            = var.app_location
  size                = var.iis_server_size
  admin_username      = var.iis_admin_username
  admin_password      = var.iis_admin_password
  network_interface_ids           = var.iis_nic_id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  provisioner "file" {
    source      = "E:\\terraform\\Ehealth\\EHealthFull\\EhealthV2\\bin\\Release\\net8.0"
    destination = "C:\\inetpub\\wwwroot"
  }
}

