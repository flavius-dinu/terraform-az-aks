terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      version = ">= 3.15.0"
      source  = "hashicorp/azurerm"
    }
    local = {
      version = ">= 2.2.0"
      source  = "hashicorp/local"
    }
  }
}
