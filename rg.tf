
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


#Guru




resource "azurerm_resource_group" "appgr111" {
  name     = "app-rg112"
  location = "North Europe"
  tags = {
    Environment = "prd"
    ManagedBy   = "Terraform"
    Owner       = " GuruSundaram "


  }


}


resource "azurerm_storage_account" "insecure" {
  name                     = "kicstest${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.appgr111.name
  location                 = azurerm_resource_group.appgr111.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}