# Availability Set
resource "azurerm_availability_set" "win_avs" {
  name                         = var.win_availability_set_name
  location                     = azurerm_resource_group.network_rg.location
  resource_group_name          = azurerm_resource_group.network_rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
}

# Public IP
resource "azurerm_public_ip" "win_vm_pip" {
  for_each            = var.win_vm_map
  name                = "${each.key}-pip"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = each.key

  tags = {
    Name         = local.win_Name
    Project      = local.win_Project
    ContactEmail = local.win_ContactEmail
    Environment  = local.win_Environment
  }
}

# NIC
resource "azurerm_network_interface" "win_vm_nic" {
  for_each            = var.win_vm_map
  name                = "${each.key}-nic"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.network_subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_vm_pip[each.key].id
  }

  tags = {
    Name         = local.win_Name
    Project      = local.win_Project
    ContactEmail = local.win_ContactEmail
    Environment  = local.win_Environment
  }
}

# Windows VM
resource "azurerm_windows_virtual_machine" "win_vm" {
  for_each            = var.win_vm_map
  name                = each.key
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = azurerm_resource_group.network_rg.location
  size                = each.value
  admin_username      = var.win_admin_username
  admin_password      = var.win_admin_password
  availability_set_id = azurerm_availability_set.win_avs.id

  network_interface_ids = [
    azurerm_network_interface.win_vm_nic[each.key].id
  ]

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.win_os_disk_caching
    storage_account_type = var.win_os_disk_type
    disk_size_gb         = var.win_os_disk_size
  }

  source_image_reference {
    publisher = var.win_vm_publisher
    offer     = var.win_vm_offer
    sku       = var.win_vm_sku
    version   = var.win_vm_version
  }

  winrm_listener {
    protocol = "Http"
  }

  tags = {
    Name         = local.win_Name
    Project      = local.win_Project
    ContactEmail = local.win_ContactEmail
    Environment  = local.win_Environment
  }
}
