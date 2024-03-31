output "client_certificate" {
  value     = azurerm_kubernetes_cluster.WS_cluster.kube_config.0.client_certificate
  sensitive = true
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.WS_cluster]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.WS_cluster.kube_config_raw
}

output "ak8s_id" {
  value       = azurerm_kubernetes_cluster.WS_cluster.id
  description = "Kubernetes id"
}

output "ak8s_fpdn" {
  value = azurerm_kubernetes_cluster.WS_cluster.fqdn
}

output "ak8s_node_rg" {
  value = azurerm_kubernetes_cluster.WS_cluster.node_resource_group
}