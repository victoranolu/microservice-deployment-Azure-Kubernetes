# Setting the Monitoring and metric alerts
resource "azurerm_monitor_action_group" "monitor_AG" {
  name                = var.monitor_AG_name
  resource_group_name = azurerm_resource_group.PMA-RG.name
  short_name          = var.monitor_AG_short_name

  # If you have the Azure mobile app you can get notification to the app 
  azure_app_push_receiver {
    name          = var.azure_app_name
    email_address = var.azure_app_email # Input the email address registred on the app
  }

  email_receiver {
    name                    = var.email_receiver_name
    email_address           = var.azure_app_email
    use_common_alert_schema = true
  }
  # SMS receiver alerts
  sms_receiver {
    name         = var.sms_receiver_name
    country_code = var.country_code
    phone_number = var.phone_number
  }
}

resource "azurerm_monitor_activity_log_alert" "monitor_log_alert" {
  name                = var.monitor_log_alert_name
  resource_group_name = azurerm_resource_group.PMA-RG.name
  scopes              = [azurerm_resource_group.PMA-RG.id]
  description         = "This alert will monitor a specific Weave Sock microservice logs updates."

  criteria {
    resource_id    = azurerm_kubernetes_cluster.WS_cluster.id
    operation_name = "Microsoft.ContainerService/managedClusters/providers/Microsoft.Insights/metricDefinitions/read"
    category       = var.criteria_category
  }

  action {
    action_group_id = azurerm_monitor_action_group.monitor_AG.id
  }
}

resource "azurerm_monitor_metric_alert" "monitor_metric" {
  name                = var.monitor_metric_name
  resource_group_name = azurerm_resource_group.PMA-RG.name
  scopes              = [azurerm_kubernetes_cluster.WS_cluster.id]
  description         = "Action will be triggered when metrics is critical."
  enabled             = true
  severity            = var.monitor_metric_severity


  criteria {
    metric_namespace       = var.criteria_metric_namespace
    metric_name            = var.criteria_metric_name
    aggregation            = var.criteria_aggregation
    operator               = var.criteria_operator
    threshold              = var.criteria_threshold
    skip_metric_validation = false

    dimension {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = ["*"]
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.monitor_AG.id
  }
}