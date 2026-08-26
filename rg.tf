
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
    Owner       = "GuruSundaram1"
    Purpose     = "Staging-Validation"
  }

}
