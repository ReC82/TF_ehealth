/*
data "azurerm_subnet" "app_subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.app_network.name
  resource_group_name  = local.resource_group
}
*/

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = var.location
  resource_group_name = var.app_ressource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "app_subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.app_ressource_group_name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}

resource "azurerm_network_interface" "app_interface" {
  count               = length(var.subnet_names)
  name                = "app-interface-${count.index}"
  location            = var.location
  resource_group_name = var.app_ressource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.app_subnet[count.index].id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.${count.index + 1}.${50 + ((count.index + 1) * 50)}"
    public_ip_address_id          = var.pub_ip[count.index] ? azurerm_public_ip.app_public_ip[count.index].id : null
  }

  depends_on = [
    azurerm_virtual_network.app_network,
    azurerm_public_ip.app_public_ip
  ]
}

resource "azurerm_public_ip" "app_public_ip" {
  # FOR TESTING PURPOSE => 3 IP PUBLICS
  count               = length(var.subnet_names)
  name                = "app-public-ip-${count.index}"
  resource_group_name = var.app_ressource_group_name
  location            = var.location
  allocation_method   = "Static"
}
