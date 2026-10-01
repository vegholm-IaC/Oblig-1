output "vm_id" {
  value       = azurerm_virtual_machine.vm.id
  description = "Azure-ID-en til den virtuelle maskinen"
}

output "vm_name" {
  value       = azurerm_virtual_machine.vm.name
  description = "Navnet på den virtuelle maskinen"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Den private IP-adressen som er tildelt nettverkskortet"
}