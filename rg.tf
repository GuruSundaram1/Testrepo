
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}



provider "azurerm" {
  features {}
  use_oidc = true
}


#Guru



resource "azurerm_resource_group" "appgrp" {
  name     = "app-rg11"
  location = "North Europe"
}


resource "azurerm_resource_group" "appgr1" {
  name     = "app-rg112"
  location = "North Europe"
}
