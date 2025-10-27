variable "resource_group_name" {
  default = "network-rg"
}

variable "location" {
  default = "Canada Central"
}

variable "vnet_name" {
  default = "network-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  default = "network-subnet1"
}

variable "subnet1_address" {
  default = ["10.0.0.0/24"]
}

variable "subnet2_name" {
  default = "network-subnet2"
}

variable "subnet2_address" {
  default = ["10.0.1.0/24"]
}

variable "nsg1_name" {
  default = "network-nsg1"
}

variable "nsg2_name" {
  default = "network-nsg2"
}

