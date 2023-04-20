resource "azurerm_key_vault_secret" "admin_user" {
  key_vault_id = var.key_vault_id
  name         = var.kv_admin_username
  value        = var.admin_username
}

resource "random_password" "admin_pw" {
  length      = 16
  special     = true
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  min_upper   = 1
}

resource "azurerm_key_vault_secret" "admin_password" {
  key_vault_id = var.key_vault_id
  name         = var.kv_admin_password
  value        = random_password.admin_pw.result
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

resource "azurerm_public_ip" "main" {
  name                = "${var.vm_name}-pip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-ni"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = var.vm_name
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.main.id]
  size                            = var.vm_size
  admin_username                  = azurerm_key_vault_secret.admin_user.value
  admin_password                  = azurerm_key_vault_secret.admin_password.value
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.vm_sku
    version   = "latest"
  }

  os_disk {
    name                 = "${var.vm_name}-os_disk"
    caching              = "ReadWrite"
    storage_account_type = var.vm_disk_storage_account_type
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
