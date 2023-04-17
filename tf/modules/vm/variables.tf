# resource group variables
variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
}

variable "resource_group_location" {
    description = "Region/location of the resource group"
    type = string
}

# Key vault variables
variable "key_vault_name" {
    description = "The name of key vault where admin credentials are stored"
    type = string
}

variable "kv_admin_username" {
    description = "The key vault secret name of VM admin username"
    type = string
}

variable "admin_username" {
    description = "The admin username"
    type = string
}

variable "key_vault_id" {
    description = "The ID of the Key Vault where the kv_admin_username and kv_admin_password should be created"
    type = string
}

variable "kv_admin_password" {
    description = "The key vault secret name of VM admin user password"
    type = string
}

# VM variables
variable "vm_name" {
    description = "The name of the Linux Virtual Machine"
    type = string
}

variable vm_subnet_id {
    description = "The ID of the Subnet where this Network Interface should be located in"
    type = string
}

variable "vm_size" {
    description = "The SKU which should be used for this Virtual Machine"
    type = string
}

variable "vm_sku" {
    description = "Specifies the SKU of the Ubuntu image used to create the virtual machines"    
    type = string
}

variable "vm_disk_storage_account_type" {
    description = "The Type of Storage Account which should back this the Internal OS Disk"
    type = string
}

variable "tags" {
    description = "Tags of the resource"
    type        = map(string)
    default     = {}
}