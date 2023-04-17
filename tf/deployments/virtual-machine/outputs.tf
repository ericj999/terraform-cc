output "name" {
    description = "DNS name of virtual machine"
    value       = module.virtual_machine.name
}

output "private_ip" {
    description = "The Primary Private IP Address assigned to this Virtual Machine"
    value       = module.virtual_machine.private_ip
}

output "public_ip" {
    description = "The Primary Public IP Address assigned to this Virtual Machine"
    value       = module.virtual_machine.public_ip
}
