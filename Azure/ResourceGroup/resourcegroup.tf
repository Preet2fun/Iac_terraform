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

resource "azurerm_resource_group" "staging-rg-Iac" {

    name = "ResourceGroup1-Iac"
    location = "West Europe"
  
}