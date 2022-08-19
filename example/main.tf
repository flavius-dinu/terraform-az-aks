provider "azurerm" {
  features {}
}

module "aks" {
  source = "../"
  kube_params = {
    kube1 = {
      name                = "kube1"
      rg_name             = "rg1"
      rg_location         = "westeurope"
      dns_prefix          = "kube"
      identity            = [{}]
      enable_auto_scaling = false
      max_count           = 1
      min_count           = 1
      node_count          = 1
      np_name             = "kube1"
      export_kube_config  = true
    }
  }
}
