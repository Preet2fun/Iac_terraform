
locals {
  updateDomain = 2
  faultDomain = 2
}

resource "azurerm_availability_set" "AVSET1-Iac" {
  name                = "AVSET1-Iac"
  location            = var.location_name
  resource_group_name = var.resource_group_name
  
  platform_update_domain_count = local.updateDomain
  platform_fault_domain_count = local.faultDomain


  tags = {
    environment = "Production"
  }
}