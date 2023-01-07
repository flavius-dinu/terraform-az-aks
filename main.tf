resource "azurerm_kubernetes_cluster" "this" {
  for_each            = var.kube_params
  name                = each.value.name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    enable_auto_scaling = each.value.enable_auto_scaling
    max_count           = each.value.enable_auto_scaling == true ? each.value.max_count : null
    min_count           = each.value.enable_auto_scaling == true ? each.value.min_count : null
    node_count          = each.value.node_count
    vm_size             = each.value.vm_size
    name                = each.value.np_name
  }

  dynamic "service_principal" {
    for_each = each.value.service_principal
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "identity" {
    for_each = each.value.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  tags = merge(var.tags, each.value.tags)
}

resource "local_file" "kube_config" {
  for_each = { for k, v in var.kube_params : k => v if v.export_kube_config == true }
  filename = each.value.kubeconfig_path
  content  = azurerm_kubernetes_cluster.this[each.key].kube_config_raw
}
