module "resource_group" {
    source = "../../modules/resource_group"

    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    tags                    = var.tags
}

module "key_vault" {
    source = "../../modules/key_vault"
    resource_group_name     = module.resource_group.name
    resource_group_location = module.resource_group.location
    key_vault_name          = var.key_vault_name
    tags                    = var.tags
}

module "network" {
    source = "../../modules/network"

    resource_group_name     = module.resource_group.name
    resource_group_location = module.resource_group.location

    vnet_name               = var.vnet_name
    vnet_address_space      = var.vnet_address_space
    subnet_name             = var.subnet_name
    subnet_prefix           = var.subnet_prefix
    nsg_name                = var.nsg_name
    nsg_security_rules      = var.nsg_security_rules
    tags                    = var.tags
}

module "virtual_machine" {
    source = "../../modules/vm"

    resource_group_name             = module.resource_group.name
    resource_group_location         = module.resource_group.location

    key_vault_id                    = module.key_vault.vault_id
    key_vault_name                  = var.key_vault_name
    kv_admin_username               = var.kv_admin_username
    admin_username                  = var.admin_username
    kv_admin_password               = var.kv_admin_password

    vm_name                         = var.vm_name
    vm_subnet_id                    = module.network.subnet_id
    vm_size                         = var.vm_size
    vm_sku                          = var.vm_sku
    vm_disk_storage_account_type    = var.vm_disk_storage_account_type

    tags                            = var.tags
}