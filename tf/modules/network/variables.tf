variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
}

variable "resource_group_location" {
    description = "Region/location of the resource group"
    type = string
}

variable "vnet_name" {
    description = "The name of the virtual network"
    type = string
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

variable "tags" {
    description = "Tags of the resource"
    type        = map(string)
    default     = {}
}