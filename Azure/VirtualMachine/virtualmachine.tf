data "terraform_remote_state" "nic" {
  backend = "azurerm"

  config = {
    resource_group_name  = "testdemotagpolicy"
    storage_account_name = "testunmangedisk"
    container_name       = "statcontainer"
    key                  = "nic.tfstate"
  }
}


  #networkinterface_id = data.terraform_remote_state.nic.outputs.virtualnetworkInterface-Iac
  #network_id = data.terraform_remote_state.nic.outputs.azurerm_virtual_network-Iac
  #subnet_id = data.terraform_remote_state.nic.outputs.azurerm_subnet-Iac

resource "azurerm_virtual_machine" "main" {
  name                  = var.VM_name
  location              = var.location_name
  resource_group_name   = var.resource_group_name
  network_interface_ids = [data.terraform_remote_state.nic.outputs.virtualnetworkInterface-Iac]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "***"
    admin_password = "****"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}