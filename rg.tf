
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}


#RG guru



resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}
