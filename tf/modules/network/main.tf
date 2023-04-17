resource "azurerm_virtual_network" "main" {
    name                = var.vnet_name
    resource_group_name = var.resource_group_name
    location            = var.resource_group_location
    address_space       = var.vnet_address_space
    tags                = var.tags
}

resource "azurerm_subnet" "main" {
    name                    = var.subnet_name
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.main.name
    address_prefixes        = var.subnet_prefix
}

resource "azurerm_network_security_group" "main" {
    name                = var.nsg_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name

    security_rule {
        name                       = "ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "https"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "Deny-all"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    tags                = var.tags

    lifecycle {
        ignore_changes = [
            tags,
        ]
    }
}