data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
    name                        = var.key_vault_name
    location                    = var.resource_group_location
    resource_group_name         = var.resource_group_name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = var.key_vault_sku

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        secret_permissions = [
            "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
        ]
    }

    tags = var.tags

    lifecycle {
        ignore_changes = [
            tags, access_policy
        ]
    }
}