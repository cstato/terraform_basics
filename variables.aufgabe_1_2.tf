variable "vnet_rg_name" {
  type = string
  default = "learning-vnt-rg"
  description = "name of vnet rg"
}

variable "vnet_rg_location" {
  type = string
  default = "westeurope"
}

variable "vnet_name" {
  type = string
  default = "learning-vnet-network"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  type = string
  default = "subnet1"
}

variable "subnet1_address_prefix" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet2_name" {
  type = string
  default = "AzureBastionSubnet"
}

variable "subnet2_address_prefix" {
  type = string
  default = "10.0.2.0/24"
}

variable "vnet_tags" {
  type = map(string)
  default = {
    "environment" = "Dev"
  }
}