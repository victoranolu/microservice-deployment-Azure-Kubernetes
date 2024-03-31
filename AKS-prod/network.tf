# Setting a secured network for the pods in the cluster
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.aks_cluster_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.PMA-RG.location
  resource_group_name = azurerm_resource_group.PMA-RG.name
}

resource "azurerm_subnet" "vnet_sub01" {
  name                                      = "${var.aks_cluster_name}-subnet01"
  resource_group_name                       = azurerm_resource_group.PMA-RG.name
  virtual_network_name                      = azurerm_virtual_network.vnet.name
  address_prefixes                          = ["10.0.1.0/24"]
  private_endpoint_network_policies_enabled = false

  delegation {
    name = "AKS-cluster"

    service_delegation {
      name    = "Microsoft.ContainerService/managedClusters"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_nat_gateway" "nat_gate" {
  name                = "${var.aks_cluster_name}-natgateway"
  location            = azurerm_resource_group.PMA-RG.location
  resource_group_name = azurerm_resource_group.PMA-RG.name
  sku_name            = "Standard"
  zones               = ["1", "2"]
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pub_ip" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gate.id
  public_ip_address_id = azurerm_public_ip.Pub_IP.id
}

resource "azurerm_subnet_nat_gateway_association" "nat_gate_asso" {
  subnet_id      = azurerm_subnet.vnet_sub01.id
  nat_gateway_id = azurerm_nat_gateway.nat_gate.id
}

resource "azurerm_network_security_group" "net_sec_grp" {
  name                = "${var.aks_cluster_name}-nsg"
  location            = azurerm_resource_group.PMA-RG.location
  resource_group_name = azurerm_resource_group.PMA-RG.name

  security_rule {
    name                   = "${var.aks_cluster_name}-sg01"
    priority               = 100
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    source_port_range      = "443"
    destination_port_range = "443"
  }
}

resource "azurerm_subnet_network_security_group_association" "sub_net_sec_grp" {
  subnet_id                 = azurerm_subnet.vnet_sub01.id
  network_security_group_id = azurerm_network_security_group.net_sec_grp.id
}

resource "azurerm_route_table" "route_sub" {
  name                = "${var.aks_cluster_name}-routetable"
  location            = azurerm_resource_group.PMA-RG.location
  resource_group_name = azurerm_resource_group.PMA-RG.name

  route {
    name                   = var.route_sub
    address_prefix         = var.address_prefix
    next_hop_type          = var.next_hop_type
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "route_table_asso" {
  subnet_id      = azurerm_subnet.vnet_sub01.id
  route_table_id = azurerm_route_table.route_sub.id
}