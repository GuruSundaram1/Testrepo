
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

#sunar

resource "azurerm_resource_group" "appgrp" {
  name     = "app-rg11"
  location = "North Europe"
}
