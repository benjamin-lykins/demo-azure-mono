module "ubuntuservers" {
  count                            = var.vm_count
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
  vm_size                          = "Standard_D1_v2"
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
