terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "testdemotagpolicy"
    storage_account_name = "testunmangedisk"
    container_name       = "statcontainer"
    key                  = "nic.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "resourcegroup-Iac" {
  name     = var.resource_group_name
  location = var.location_name
}

resource "azurerm_virtual_network" "virtualnetwork-Iac" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resourcegroup-Iac.location
  resource_group_name = azurerm_resource_group.resourcegroup-Iac.name
}

resource "azurerm_subnet" "virtualsubnet-Iac" {
  name                 = var.Subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vNIC-Iac" {
  name                = var.NIC_name
  location            = var.location_name
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.virtualsubnet-Iac.id
    private_ip_address_allocation = "Dynamic"
  }
}

output "virtualnetworkInterface-Iac" {
  description = "This will returns id of virtual network interface created"
  value = azurerm_network_interface.vNIC-Iac.id

}

output "azurerm_virtual_network-Iac" {
  description = "This will returns id of virtual network interface created"
  value = azurerm_virtual_network.virtualnetwork-Iac.id

}

output "azurerm_subnet-Iac" {
  description = "This will returns id of virtual network interface created"
  value = azurerm_subnet.virtualsubnet-Iac.id

}

