variable "resource_group_name" {
  type = string
  default = "vNET-resourcesGroup-Iac"
}

variable "virtual_network_name" {
  type = string
  default = "virtualNetwork1-Iac"
}

variable "location_name" {
  type = string
  default = "West Europe"
}

variable "Subnet_name" {
  type = string
  default = "Internal"
}

variable "NIC_name" {
  type = string
  default = "NetworkInterfaceCard-Iac"
}

variable "VM_name" {
  type = string
  default = "VM-Linux-Iac"
}

