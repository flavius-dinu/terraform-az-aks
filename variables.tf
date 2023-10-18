variable "kube_params" {
  type = map(object({
    name                = string
    rg_name             = string
    rg_location         = string
    dns_prefix          = string
    client_id           = optional(string, null)
    client_secret       = optional(string, null)
    vm_size             = optional(string, "Standard_DS2_v2")
    enable_auto_scaling = optional(string, true)
    max_count           = optional(number, 1)
    min_count           = optional(number, 1)
    node_count          = optional(number, 1)
    np_name             = string
    service_principal = optional(list(object({
      client_id     = optional(string, null)
      client_secret = optional(string, null)
    })), [])
    identity = optional(list(object({
      type         = optional(string, "SystemAssigned")
      identity_ids = optional(list(string), [])
    })), [])
    kubeconfig_path    = optional(string, "~./kube/config")
    export_kube_config = optional(bool, false)
    tags               = optional(map(string), {})
  }))
  description = "AKS params"
}

variable "tags" {
  type        = map(string)
  description = "Global tags to apply to the resources"
  default     = {}
}
