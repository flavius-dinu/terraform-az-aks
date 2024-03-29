output "kube_params" {
  value = { for kube in azurerm_kubernetes_cluster.this : kube.name => { "id" : kube.id, "fqdn" : kube.fqdn } }
}

output "kube_config" {
  value     = { for kube in azurerm_kubernetes_cluster.this : kube.name => kube.kube_config_raw }
  sensitive = true
}

output "kube_config_path" {
  value = { for k, v in local_file.kube_config : k => v.filename }
}
