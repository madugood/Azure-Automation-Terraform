locals {
  Name         = "Terraform-Class"
  Project      = "Learning"
  ContactEmail = "madugood247@gmail.com"
  Environment  = "Lab"
}

variable "linux_name" {
  default = "madugood5678-u-vm1"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "madugood"
}

variable "public_key_path" {
  default = "id_rsa.pub"
}

variable "os_disk_type" {
  default = "Premium_LRS"
}

variable "os_disk_size" {
  default = 32
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "vm_publisher" {
  default = "Canonical"
}

variable "vm_offer" {
  default = "0001-com-ubuntu-server-jammy"
}

variable "vm_sku" {
  default = "22_04-lts-gen2"
}

variable "vm_version" {
  default = "latest"
}
