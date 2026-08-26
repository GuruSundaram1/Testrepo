
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

#Guru
#Guru
resource "azurerm_resource_group" "appgrp" {
  name     = "app-rg11"
  location = "North Europe"
}


resource "azurerm_resource_group" "appgr" {
  name     = "app-rg12"
  location = "North Europe"
}
