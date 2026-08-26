
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}



provider "azurerm" {
  features {}
  use_oidc = true
}


#Gurusundaram




resource "azurerm_resource_group" "appgr111" {
  name     = "app-rg112"
  location = "North Europe"
  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
    Owner       = " GuruSundaram "
    Purpose     = "Staging-Validation"

  }


}


resource "azurerm_storage_account" "insecure" {
  name                     = "kicstest${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.appgr111.name
  location                 = azurerm_resource_group.appgr111.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # 🚨 KICS WILL FLAG THIS (Public access)
  allow_blob_public_access = true
}

resource "azurerm_storage_account_network_rules" "insecure_network" {
  resource_group_name  = azurerm_resource_group.appgr111.name
  storage_account_name = azurerm_storage_account.insecure.name

  # 🚨 KICS WILL FLAG THIS (Default action = Allow)
  default_action = "Allow"
  bypass         = ["AzureServices"]
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

