resource "azurerm_user_assigned_identity" "base" {
  name                = "base"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_role_assignment" "base" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.base.principal_id
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "${local.env}-${local.eks_name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "devaks1"

  default_node_pool {
  name                 = "general"
  vm_size              = "Standard_D2_v2"
  node_count           = 1
  type                 = "VirtualMachineScaleSets"
  vnet_subnet_id       = azurerm_subnet.subnet1.id
  orchestrator_version = local.eks_version

  node_labels = {
    role = "general"
  }
}


  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.64.0.0/19"
    dns_service_ip = "10.64.0.10"
  }


  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.base.id]
  }

  kubernetes_version       = local.eks_version
  private_cluster_enabled  = false
  node_resource_group      = "${azurerm_resource_group.this.name}-${local.env}-${local.eks_name}"
}







