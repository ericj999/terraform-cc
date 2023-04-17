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
    default = "sshuser-name"
}

variable "admin_username" {
    description = "The VM admin username"
    type = string
    default = "sshuser"
}

variable "kv_admin_password" {
    description = "The key vault secret name of VM admin user password"
    type = string
    default = "sshuser-password"
}

# VM variables
variable "vm_name" {
    description = "The name of the Linux Virtual Machine"
    type = string
}

variable "vnet_name" {
    description = "The virtual netowrk name where this vm should be located in"
}

variable "vnet_address_space" {
    description = "The address space that is used the virtual network"
    type = list(string)
}

variable "subnet_name" {
    description = "The name of the subnet"
    type = string
}

variable "subnet_prefix" {
    description = "The address prefixes to use for the subnet"
    type = list(string)
}

variable "nsg_name" {
    description = "The name of the network security group"
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