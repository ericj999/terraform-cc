locals {
    default_security_rule = {
        "Deny-all" = {
            priority                   = 4096
            direction                  = "Inbound"
            access                     = "Deny"
            protocol                   = "*"
            source_port_range          = "*"
            destination_port_range     = "*"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }        
    }
    nsg_security_rules = merge( local.default_security_rule, {
        for key, config in var.nsg_security_rules: key => 
            merge(
                {
                    priority                   = -1
                    direction                  = "Inbound"
                    access                     = "Allow"
                    protocol                   = "Tcp"
                    source_port_range          = 0
                    destination_port_range     = ""
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                },
                config
            )
        }
    )
}