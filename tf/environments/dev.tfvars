resource_group_name = "echen-example-rg"
resource_group_location = "eastus"
key_vault_name = "echen-example-keyvault"

vnet_name = "example-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnet_name = "example-subnet"
subnet_prefix = ["10.0.1.0/24"]
nsg_name = "example-nsg"


vm_name = "example-vm"
vm_size = "Standard_F2"
vm_sku = "18.04-LTS"
vm_disk_storage_account_type = "Standard_LRS"

tags = {
    environment = "dev"
    owner = "eric.chen"
}
