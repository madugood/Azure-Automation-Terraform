output "vm_hostname" {
  value = azurerm_linux_virtual_machine.vm_linux.name
}

output "vm_fqdn" {
  value = azurerm_public_ip.vm_pip.fqdn
}

output "private_ip" {
  value = azurerm_network_interface.vm_nic.ip_configuration[0].private_ip_address
}

output "public_ip" {
  value = azurerm_public_ip.vm_pip.ip_address
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
