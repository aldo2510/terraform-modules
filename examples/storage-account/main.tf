terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-ai-iac-dev"
  location = "eastus"
}

module "storage" {
  source = "../../modules/azure-storage-account"

  name                     = "staiiacdev01"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  environment              = "dev"
  account_replication_type = "LRS"
}

output "storage_account_id" {
  value = module.storage.id
}
