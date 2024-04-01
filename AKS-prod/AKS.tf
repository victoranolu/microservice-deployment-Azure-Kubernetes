resource "azurerm_resource_group" "PMA-RG" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "WS_cluster" {
  name                                = var.aks_cluster_name
  location                            = azurerm_resource_group.PMA-RG.location
  resource_group_name                 = azurerm_resource_group.PMA-RG.name
  role_based_access_control_enabled   = true
  azure_policy_enabled                = true
  http_application_routing_enabled    = true
  private_cluster_enabled             = true
  private_cluster_public_fqdn_enabled = true
  run_command_enabled                 = true


  azure_active_directory_role_based_access_control {
    managed            = true
    azure_rbac_enabled = true
  }

  auto_scaler_profile {
    balance_similar_node_groups = true
    max_node_provisioning_time  = var.max_node_provisioning_time
    max_unready_nodes           = var.max_unready_nodes

  }

  default_node_pool {
    name                  = var.default_node_pool_name
    node_count            = var.default_node_pool_node_count
    min_count             = var.default_node_pool_min_count
    max_count             = var.default_node_pool_max_count
    vm_size               = var.default_node_pool_vm_size
    enable_auto_scaling   = true
    enable_node_public_ip = true
    gpu_instance          = var.default_node_pool_gpu_instance
    os_disk_type          = var.default_node_pool_os_disk_type
    os_sku                = var.default_node_pool_os_sku
    scale_down_mode       = var.default_node_pool_scale_down_mode
    type                  = var.default_node_pool_type
    workload_runtime      = var.default_node_pool_workload_runtime
    vnet_subnet_id        = azurerm_subnet.vnet_sub01.id
  }

  identity {
    type         = "SystemAssigned"
  }

  # setting an automated window upgrade
  maintenance_window_auto_upgrade {
    frequency    = var.maintenance_window_auto_upgrade_frequency
    interval     = var.maintenance_window_auto_upgrade_interval
    duration     = var.maintenance_window_auto_upgrade_duration
    day_of_week  = var.maintenance_window_auto_upgrade_day_of_week
    day_of_month = var.maintenance_window_auto_upgrade_day_of_month
    week_index   = var.maintenance_window_auto_upgrade_week_index
    start_time   = var.maintenance_window_auto_upgrade_start_time
    start_date   = var.maintenance_window_auto_upgrade_start_date
    utc_offset   = var.maintenance_window_auto_upgrade_utc_offset
  }

  # setting the network profile
  network_profile {
    network_plugin      = var.network_profile_network_plugin
    network_mode        = var.network_profile_network_mode   # Azure Kubernetes Service can not use bridge network mode to set up new Kubernetes Clusters but can be used for existing Kubernetes Cluster
    network_policy      = var.network_profile_network_policy # Cilium enables me not to install a separate network policy engine such as Calico. Cilium is used because I am only going to be using Linux
    network_plugin_mode = var.network_plugin_mode
    ebpf_data_plane     = var.ebpf_data_plane
    outbound_type       = var.outbound_type
    load_balancer_sku   = var.load_balancer_sku
    load_balancer_profile {
      outbound_ip_address_ids = [azurerm_public_ip.Pub_IP.id]
    }
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_anal.id
  }

  service_mesh_profile {
    mode = var.service_mesh_profile_mode
  }

  web_app_routing {
    dns_zone_id = azurerm_dns_zone.DNS_zone.id
  }

  tags = {
    Environment = "Prod"
  }
}