# Setting the DNS zone, records such as A record so that the microservice in the kubernetes external IP can have a human readable URL to recah the service
resource "azurerm_dns_zone" "DNS_zone" {
  name                = var.DNS_zone_name
  resource_group_name = azurerm_resource_group.PMA-RG.name
}

resource "azurerm_public_ip" "Pub_IP" {
  name                = var.Pub_IP_name
  resource_group_name = azurerm_resource_group.PMA-RG.name
  location            = azurerm_resource_group.PMA-RG.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
  sku_tier            = var.sku_tier
  ip_version          = var.ip_version

  tags = {
    environment = "Prod"
  }
}

resource "azurerm_dns_a_record" "DNS_a_record" {
  name                = var.DNS_record_name
  zone_name           = azurerm_dns_zone.DNS_zone.name
  resource_group_name = azurerm_resource_group.PMA-RG.name
  ttl                 = var.ttl
  target_resource_id  = azurerm_public_ip.Pub_IP.id
}