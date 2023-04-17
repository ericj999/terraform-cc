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

variable "key_vault_sku" {
    description = "The Name of the SKU used for this Key Vault"
    type = string
    default = "standard"
}

variable "tags" {
    description = "Tags of the resource"
    type        = map(string)
    default     = {}
}
