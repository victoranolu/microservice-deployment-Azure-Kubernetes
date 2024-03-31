variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location region for all the resource"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the AKS Cluster"
}

variable "max_node_provisioning_time" {
  type        = string
  description = "Maximium node provision time"
}

variable "max_unready_nodes" {
  type        = number
  description = "Maximium Unready Nodes"
}

variable "default_node_pool_name" {
  type        = string
  description = "Name of default node configuration"
}

variable "default_node_pool_node_count" {
  type        = number
  description = "Node count number"
}

variable "default_node_pool_min_count" {
  type        = number
  description = "Minimium node count"
}

variable "default_node_pool_max_count" {
  type        = number
  description = "Maximium count"
}

variable "default_node_pool_vm_size" {
  type        = string
  description = "Virtual Machine size of the node pool"
}

variable "default_node_pool_gpu_instance" {
  type        = string
  description = "GPU Instance"
}

variable "default_node_pool_os_disk_type" {
  type        = string
  description = "OS disk type"
}

variable "default_node_pool_os_sku" {
  type        = string
  description = "OS type"
}

variable "default_node_pool_scale_down_mode" {
  type        = string
  description = "Scale down mode"
}

variable "default_node_pool_type" {
  type        = string
  description = "Default node pool type"
}

variable "default_node_pool_workload_runtime" {
  type        = string
  description = "Workload runtime"
}

variable "maintenance_window_auto_upgrade_frequency" {
  type        = string
  description = "Frequency of maintenance"
}

variable "maintenance_window_auto_upgrade_interval" {
  type        = number
  description = "Time interval in the month for auto maintenance"
}

variable "maintenance_window_auto_upgrade_duration" {
  type        = number
  description = "Time duration when maintenance start"
}

variable "maintenance_window_auto_upgrade_day_of_week" {
  type        = string
  description = "Day of the week maintenance start"
}

variable "maintenance_window_auto_upgrade_day_of_month" {
  type        = number
  description = "Day of the month auto maintenance start"
}

variable "maintenance_window_auto_upgrade_week_index" {
  type        = string
  description = "The week index of when auto maintenance start"
}

variable "maintenance_window_auto_upgrade_start_time" {
  type        = string
  description = "Time of the day auto maintenance start"
}

variable "maintenance_window_auto_upgrade_start_date" {
  type        = string
  description = "Date for when auto maintenance start"
}

variable "maintenance_window_auto_upgrade_utc_offset" {
  type        = string
  description = "Time zone for auto maintenace starting"
}

variable "network_profile_network_plugin" {
  type        = string
  description = "Network plugin type"
}

variable "network_profile_network_mode" {
  type        = string
  description = "Network profile mode"
}

variable "network_profile_network_policy" {
  type        = string
  description = "Network profile policy"
}

variable "ebpf_data_plane" {
  type = string
}

variable "network_plugin_mode" {
  type        = string
  description = "Network plugin mode"
}

variable "outbound_type" {
  type        = string
  description = "outbound network type"
}

variable "load_balancer_sku" {
  type        = string
  description = "sku of load balancer type"
}

variable "service_mesh_profile_mode" {
  type        = string
  description = "service mesh mode"
}

variable "DNS_zone_name" {
  type        = string
  description = "DNS zone name"
}

variable "Pub_IP_name" {
  type        = string
  description = "Public IP name"
}

variable "allocation_method" {
  type        = string
  description = "Publi IP allocation type"
}

variable "sku" {
  type        = string
  description = "Public IP sku"
}

variable "sku_tier" {
  type        = string
  description = "Public IP sku tier"
}

variable "ip_version" {
  type        = string
  description = "IP verion for the Public IP"
}

variable "DNS_record_name" {
  type = string
}

variable "ttl" {
  type = number
}

variable "log_anal_name" {
  type        = string
  description = "Log analytic workshop name"
}

variable "log_anal_sku" {
  type = string
}

variable "retention_in_days" {
  type = number
}

variable "solution_name" {
  type        = string
  description = "Log analytic solution name"
}

variable "monitor_AG_name" {
  type        = string
  description = "Monitor workspace"
}

variable "monitor_AG_short_name" {
  type = string
}

variable "azure_app_name" {
  type        = string
  description = "The Azure Mobile App username"
}

variable "azure_app_email" {
  type        = string
  description = "Azure App User email address"
}

variable "email_receiver_name" {
  type = string
}

variable "sms_receiver_name" {
  type = string
}

variable "country_code" {
  type = string
}

variable "phone_number" {
  type = string
}

variable "monitor_log_alert_name" {
  type = string
}

variable "criteria_category" {
  type = string
}

variable "monitor_metric_name" {
  type = string
}

variable "monitor_metric_severity" {
  type = number
}

variable "criteria_metric_namespace" {
  type = string
}

variable "criteria_metric_name" {
  type = string
}

variable "criteria_aggregation" {
  type = string
}

variable "criteria_operator" {
  type = string
}

variable "criteria_threshold" {
  type = number
}

variable "dimension_name" {
  type = string
}

variable "dimension_operator" {
  type = string
}

variable "route_sub" {
  type = string
}

variable "address_prefix" {
  type = string
}

variable "next_hop_type" {
  type = string
}

variable "next_hop_in_ip_address" {
  type = string
}