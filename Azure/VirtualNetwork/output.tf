output "virtualnetwork-Iac" {
  description = "This will returns id of virtual network created"
  value = azurerm_virtual_network.vNET-Iac.id

}

output "subnet-4" {
  description = "This will returns id of subnet-4"
  value = azurerm_subnet.subnet4.id
}