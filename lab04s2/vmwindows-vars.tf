locals {
  win_Name         = "Terraform"
  win_Project      = "Hands-on"
  win_ContactEmail = "madu4good@gmail.com"
  win_Environment  = "Azure-lab"
}

variable "win_availability_set_name" {
  default = "windows-avs"
}

variable "win_vm_map" {
  default = {
    "mg-wvm1" = "Standard_B1s"
    //"mg-wvm2" = "Standard_B1ms"
  }
}

variable "win_admin_username" {
  default = "madugood"
}

variable "win_admin_password" {
  default = "Password123!"
}

variable "win_os_disk_type" {
  default = "StandardSSD_LRS"
}

variable "win_os_disk_size" {
  default = 128
}

variable "win_os_disk_caching" {
  default = "ReadWrite"
}

variable "win_vm_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "win_vm_offer" {
  default = "WindowsServer"
}

variable "win_vm_sku" {
  default = "2016-Datacenter"
}

variable "win_vm_version" {
  default = "latest"
}

variable "win_public_key_path" {
  default = "id_rsa.pub"
}

variable "win_instance_count" {
  default = 2
}
