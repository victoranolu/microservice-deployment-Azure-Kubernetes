# Setting up the logging, monitoring and analytics
resource "azurerm_log_analytics_workspace" "log_anal" {
  name                            = var.log_anal_name
  location                        = azurerm_resource_group.PMA-RG.location
  resource_group_name             = azurerm_resource_group.PMA-RG.name
  sku                             = var.log_anal_sku
  retention_in_days               = var.retention_in_days
  allow_resource_only_permissions = true
  internet_ingestion_enabled      = true
  internet_query_enabled          = true

  identity {
    type         = "UserAssigned"
    identity_ids = ""
  }
}

resource "azurerm_log_analytics_solution" "sol_anal" {
  solution_name         = var.solution_name
  location              = azurerm_resource_group.PMA-RG.location
  resource_group_name   = azurerm_resource_group.PMA-RG.name
  workspace_resource_id = azurerm_log_analytics_workspace.log_anal.id
  workspace_name        = azurerm_log_analytics_workspace.log_anal.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}