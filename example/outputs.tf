output "kube_params" {
  value = module.aks.kube_params
}

# output "kube_config" {
#   value = module.aks.kube_config
# }

output "kube_config_path" {
  value = module.aks.kube_config_path
}
