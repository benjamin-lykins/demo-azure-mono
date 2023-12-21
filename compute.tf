variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vm_os_simple" {
  type    = string
  default = "UbuntuServer"
}

resource "random_id" "id" {
  byte_length = 4
}

resource "azurerm_resource_group" "test" {
  location = var.location
  name     = "host${random_id.id.hex}-rg"
}



module "ubuntuservers" {
  source                           = "Azure/compute/azurerm"
  version                          = "5.3.0"
  vm_hostname                      = "${random_id.id.hex}-u"
  resource_group_name              = azurerm_resource_group.test.name
  location                         = azurerm_resource_group.test.location
  admin_username                   = var.admin_username
  boot_diagnostics                 = false
  vm_os_simple                     = var.vm_os_simple
  vnet_subnet_id                   = module.vnet.vnet_subnets[0]
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  enable_ssh_key                   = true
  ssh_key                          = "monica_id_rsa.pub"
  storage_account_type             = "Standard_LRS"
  vm_size                          = "Standard_F2"
  nb_data_disk                     = 1
  vm_extensions = [
    {
      name                 = "hostname"
      publisher            = "Microsoft.Azure.Extensions",
      type                 = "CustomScript",
      type_handler_version = "2.0",
      settings             = "{\"commandToExecute\": \"hostname && uptime\"}",
    },
    {
      name                       = "AzureMonitorLinuxAgent"
      publisher                  = "Microsoft.Azure.Monitor",
      type                       = "AzureMonitorLinuxAgent",
      type_handler_version       = "1.21",
      auto_upgrade_minor_version = true
    },
  ]
}