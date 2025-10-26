# Public IP
resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.linux_name}-pip"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.linux_name

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }

}

# NIC
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.linux_name}-nic"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.network_subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
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
  name                  = var.linux_name
  resource_group_name   = azurerm_resource_group.network_rg.name
  location              = azurerm_resource_group.network_rg.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk"
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

  tags = {
    Name         = local.Name
    Project      = local.Project
    ContactEmail = local.ContactEmail
    Environment  = local.Environment
  }
}
