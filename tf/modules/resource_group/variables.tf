variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
}

variable "resource_group_location" {
    description = "Region/location of the resource group"
    type = string
}

variable "tags" {
    description = "Tags of the resource"
    type        = map(string)
    default     = {}
}