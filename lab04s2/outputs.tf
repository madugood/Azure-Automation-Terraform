output "vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.vm_linux : vm.name]
}

output "vm_fqdns" {
  value = [for pip in azurerm_public_ip.vm_pip : pip.fqdn]
}

output "private_ips" {
  value = [for nic in azurerm_network_interface.vm_nic : nic.ip_configuration[0].private_ip_address]
}

output "public_ips" {
  value = [for pip in azurerm_public_ip.vm_pip : pip.ip_address]
}

output "vnet_name" {
  value = azurerm_virtual_network.network_vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network_vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.network_subnet1.name
}

output "subnet1_address" {
  value = azurerm_subnet.network_subnet1.address_prefixes
}

output "subnet2_name" {
  value = azurerm_subnet.network_subnet2.name
}

output "subnet2_address" {
  value = azurerm_subnet.network_subnet2.address_prefixes
}

output "windows_availability_set_name" {
  value = azurerm_availability_set.win_avs.name
}

output "windows_vm_names" {
  value = [for vm in azurerm_windows_virtual_machine.win_vm : vm.name]
}

output "windows_vm_fqdns" {
  value = [for pip in azurerm_public_ip.win_vm_pip : pip.fqdn]
}

output "windows_vm_private_ips" {
  value = [for nic in azurerm_network_interface.win_vm_nic : nic.ip_configuration[0].private_ip_address]
}

output "windows_vm_public_ips" {
  value = [for pip in azurerm_public_ip.win_vm_pip : pip.ip_address]
}
