resource "azurerm_virtual_network" "this" {
  name                = "hipaa-subent1"
  address_space       = ["10.0.0.0/19"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "example" {
  name                 = "hipaa-subnet2"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.32.0/19"]
}