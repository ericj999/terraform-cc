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

    dynamic "security_rule" {
        for_each = local.nsg_security_rules
        content {
            name                       = security_rule.key
            priority                   = security_rule.value.priority
            direction                  = security_rule.value.direction
            access                     = security_rule.value.access
            protocol                   = security_rule.value.protocol
            source_port_range          = security_rule.value.source_port_range
            destination_port_range     = security_rule.value.destination_port_range
            source_address_prefix      = security_rule.value.source_address_prefix
            destination_address_prefix = security_rule.value.destination_address_prefix
        }
    }
    tags                = var.tags

    lifecycle {
        ignore_changes = [
            tags,
        ]
    }
}