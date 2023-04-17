output "name" {
    description = "Resource group name"
    value       = azurerm_resource_group.main.name
}

output "location" {
    description = "Resource group location/region"
    value       = azurerm_resource_group.main.location
}