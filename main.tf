resource "azurerm_kubernetes_cluster" "this" {
  for_each            = var.kube_params
  name                = each.value.name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    enable_auto_scaling = lookup(each.value, "enable_auto_scaling", true)
    max_count           = lookup(each.value, "enable_auto_scaling", true) ? lookup(each.value, "max_count", 1) : null
    min_count           = lookup(each.value, "enable_auto_scaling", true) ? lookup(each.value, "min_count", 1) : null
    node_count          = lookup(each.value, "node_count", 1)
    vm_size             = lookup(each.value, "vm_size", "Standard_DS2_v2")
    name                = each.value.np_name
  }

  dynamic "service_principal" {
    for_each = lookup(each.value, "service_principal", [])
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "identity" {
    for_each = lookup(each.value, "identity", [])
    content {
      type         = lookup(identity.value, "type", "SystemAssigned")
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }
  tags = merge(var.tags, lookup(each.value, "tags", {}))
}

resource "local_file" "kube_config" {
  for_each = { for k, v in var.kube_params : k => v if lookup(v, "export_kube_config", false) == true }
  filename = lookup(each.value, "kubeconfig_path", "~./kube/config")
  content  = azurerm_kubernetes_cluster.this[each.key].kube_config_raw
}
