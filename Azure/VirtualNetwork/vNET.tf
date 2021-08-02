
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.70.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "vNET-RG-Iac" {
  name     = "vNET-resourcesGroup-Iac"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vNET-Iac" {
  name                = "virtualNetwork1-Iac"
  location            = azurerm_resource_group.vNET-RG-Iac.location
  resource_group_name = azurerm_resource_group.vNET-RG-Iac.name
  address_space       = ["10.0.0.0/16"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }


  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "subnet4" {
  name                 = "subnet4"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.4.0/24"]
}