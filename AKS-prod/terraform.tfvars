resource_group_name                          = "Weave Sock Microservice"
location                                     = "West US 2"
aks_cluster_name                             = "weavesock-aks"
max_node_provisioning_time                   = "10m"
max_unready_nodes                            = 3
default_node_pool_name                       = "Weave-Sock-node-pool"
default_node_pool_node_count                 = 2
default_node_pool_min_count                  = 1
default_node_pool_max_count                  = 4
default_node_pool_vm_size                    = "Standard_D2s_v3"
default_node_pool_gpu_instance               = "MIG2g"
default_node_pool_os_disk_type               = "Managed"
default_node_pool_os_sku                     = "Ubuntu"
default_node_pool_scale_down_mode            = "Delete"
default_node_pool_type                       = "VirtualMachineSets"
default_node_pool_workload_runtime           = "OCIContainer"
maintenance_window_auto_upgrade_frequency    = "AbsoluteMonthly"
maintenance_window_auto_upgrade_interval     = 30
maintenance_window_auto_upgrade_duration     = 2
maintenance_window_auto_upgrade_day_of_week  = "Monday"
maintenance_window_auto_upgrade_day_of_month = 0
maintenance_window_auto_upgrade_week_index   = "First"
maintenance_window_auto_upgrade_start_time   = "08:00"
maintenance_window_auto_upgrade_start_date   = "01-05-2024"
maintenance_window_auto_upgrade_utc_offset   = "+00:00"
network_profile_network_plugin               = "azure"
network_profile_network_mode                 = "bridge"
network_profile_network_policy               = "azure"
ebpf_data_plane                              = "cilium"
network_plugin_mode                          = "overlay"
outbound_type                                = "loadbalancer"
load_balancer_sku                            = "standard"
service_mesh_profile_mode                    = "Istio"
DNS_zone_name                                = "WeaveSock.com"
Pub_IP_name                                  = "Weave-Sock-IP"
allocation_method                            = "Static"
sku                                          = "Standard"
sku_tier                                     = "Global"
ip_version                                   = "IPv4"
DNS_record_name                              = "@"
ttl                                          = 300
log_anal_name                                = "Weave-Sock-30-03-2024"
log_anal_sku                                 = "Standard"
retention_in_days                            = 30
solution_name                                = "WeaveSockSolutions"
monitor_AG_name                              = "WeaveSockActionGroup"
monitor_AG_short_name                        = "WSaction"
azure_app_name                               = "pushtoadmin"
azure_app_email                              = "afactor05@gmail.com"
email_receiver_name                          = "sendtodevops"
sms_receiver_name                            = "oncallmsg"
country_code                                 = "+234"
phone_number                                 = "08073126012"
monitor_log_alert_name                       = "weavesock-activitylogalert"
criteria_category                            = "ServiceHealth"
monitor_metric_name                          = "weavesock-metricalert"
monitor_metric_severity                      = 3
criteria_metric_namespace                    = "Sales"
criteria_metric_name                         = "Socks"
criteria_aggregation                         = "Total"
criteria_operator                            = "GreaterThan"
criteria_threshold                           = 50
dimension_name                               = "Socks"
dimension_operator                           = "Include"
route_sub                                    = "route_sub01"
address_prefix                               = "10.100.0.0/14"
next_hop_type                                = "VirtualAppliance"
next_hop_in_ip_address                       = "10.10.1.1"