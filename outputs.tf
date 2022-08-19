output "kube_params" {
  value = { for kube in azurerm_kubernetes_cluster.this : kube.name => { "id" : kube.id, "fqdn" : kube.fqdn } }
}

output "kube_config" {
  value = { for kube in azurerm_kubernetes_cluster.this : kube.name => nonsensitive(kube.kube_config) }
}
