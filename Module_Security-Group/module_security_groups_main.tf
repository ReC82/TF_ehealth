# Public IP
# .NET
# SUBNET 1

# Create Resource Group rg_ehealth
/*
resource "azurerm_resource_group" "rg_ehealth"{
    name = var.nsg_rg_group_name
    location = var.nsg_rg_location

    tags = var.nsg_tags
}*/

# Create Network Security Group and rule nsg1_app
resource "azurerm_network_security_group" "nsg_app" {
    name                = var.nsg_app_name
    location            = var.nsg_rg_location
    resource_group_name = var.nsg_rg_group_name

    security_rule {
        name                       = "app-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        destination_address_prefix = "10.0.1.100"
        source_address_prefix      = "*"
    }
    security_rule {
        name                       = "app-rdp"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.1.100"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
    }
    security_rule {
        name                       = "app-winrm"
        priority                   = 250
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.1.100"
        destination_port_range     = "5985"
        source_address_prefix      = "*"
    }
    security_rule {
        name                       = "app-winrm-https"
        priority                   = 251
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.1.100"
        destination_port_range     = "5986"
        source_address_prefix      = "*"
    }
    security_rule {
        name                       = "app-webdeploy"
        priority                   = 1010
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.1.100"
        destination_port_range     = "8172"
        source_address_prefix      = "*"
    }  

    tags = var.nsg_tags
}

# Create Network Security Group and rule nsg2_api
resource "azurerm_network_security_group" "nsg_api" {
    name                = var.nsg_api_name
    location            = var.nsg_rg_location
    resource_group_name = var.nsg_rg_group_name

    security_rule {
        name                       = "api-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        destination_address_prefix = "10.0.2.150/32"
        source_address_prefix      = "10.0.1.100/32"
    }

    tags = var.nsg_tags
}

# Create Network Security Group and rule nsg3_db
resource "azurerm_network_security_group" "nsg_db" {
    name                = var.nsg_db_name
    location            = var.nsg_rg_location
    resource_group_name = var.nsg_rg_group_name

    security_rule {
        name                       = "db-mysql"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.1.100"
        destination_port_range     = "3306"
        source_address_prefix      = "10.0.2.150/32"
    }
    security_rule {
        name                       = "db-ssh"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_address_prefix = "10.0.3.200"
        destination_port_range     = "22"
        source_address_prefix      = "*"
    }    

    tags = var.nsg_tags
}

/*
# Create network interface
resource "azurerm_network_interface" "app-nic" {
    name                = var.network_interface_name
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet_id.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.public_ip.id
    }

    tags = var.nsg_tags
}
*/

# Connect the security group to the network interface
# app
resource "azurerm_network_interface_security_group_association" "app_association" {
    network_interface_id      = var.nsg_nic_app[0]
    network_security_group_id = azurerm_network_security_group.nsg_app.id
}

# api
resource "azurerm_network_interface_security_group_association" "api_association" {
    network_interface_id      = var.nsg_nic_api[0]
    network_security_group_id = azurerm_network_security_group.nsg_api.id
}

# db 
resource "azurerm_network_interface_security_group_association" "db_association" {
    network_interface_id      = var.nsg_nic_db[0]
    network_security_group_id = azurerm_network_security_group.nsg_db.id
}


