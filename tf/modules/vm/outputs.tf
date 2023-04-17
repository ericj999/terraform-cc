output "name" {
    description = "DNS name of virtual machine"
    value       = azurerm_linux_virtual_machine.main.name
}

output "private_ip" {
    description = "The Primary Private IP Address assigned to this Virtual Machine"
    value       = azurerm_linux_virtual_machine.main.private_ip_address
}

output "public_ip" {
    description = "The Primary Public IP Address assigned to this Virtual Machine"
    value       = azurerm_linux_virtual_machine.main.public_ip_address
}
