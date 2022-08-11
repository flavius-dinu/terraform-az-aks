terraform {
  required_providers {
    azurerm = {
      version = ">= 3.15.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "terratfstate7"
    container_name       = "tfstate"
    key                  = "example.terraform.tfstate"
  }
}
