
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.1.0"

  resource_group_name = azurerm_resource_group.test.name
  use_for_each        = true
  vnet_location       = azurerm_resource_group.test.location
  address_space       = ["192.168.0.0/24"]
  vnet_name           = "vnet-vm-${random_id.id.hex}"
  subnet_names        = ["subnet-compute"]
  subnet_prefixes     = ["192.168.0.0/28"]
}

