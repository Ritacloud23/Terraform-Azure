resource "azurerm_subnet" "subnet1" {
  name                 = "hipaa-subnet2"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.32.0/19"]
}