# Public IP
resource "azurerm_public_ip" "vm_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${count.index}"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "${var.linux_name}-${count.index}"

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }

}

# NIC
resource "azurerm_network_interface" "vm_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${count.index}"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.network_subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip[count.index].id
  }

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }

}

# Linux VM
resource "azurerm_linux_virtual_machine" "vm_linux" {
  count               = var.nb_count
  name                = "${var.linux_name}-${count.index}"
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = azurerm_resource_group.network_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  availability_set_id = azurerm_availability_set.linux_avs.id

  network_interface_ids = [
    azurerm_network_interface.vm_nic[count.index].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk-${count.index}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  computer_name = "${var.linux_name}-${count.index}"

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }
}


#Availability Set
resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = azurerm_resource_group.network_rg.location
  resource_group_name          = azurerm_resource_group.network_rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
}

