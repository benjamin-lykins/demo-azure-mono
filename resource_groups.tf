resource "random_id" "id" {
  byte_length = 4
}

resource "azurerm_resource_group" "test" {
  location = var.location
  name     = "host${random_id.id.hex}-rg"
}
