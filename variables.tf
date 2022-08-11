variable "kube_params" {
  type        = any
  description = <<-EOF
    name                = string
    rg_name             = string
    rg_location         = string
    dns_prefix          = string
    client_id           = string
    client_secret       = string
    vm_size             = string
    enable_auto_scaling = string
    max_count           = number
    min_count           = number
    node_count          = number
    np_name             = string
    service_principal   = list(object({
      client_id     = string
      client_secret = string
    }))
    identity            = list(object({
      type         = string
      identity_ids = list(string)
    }))
EOF
}

variable "tags" {
  type        = any
  description = <<EOT
  Global tags to apply to the resources.
EOT
  default     = {}
}
