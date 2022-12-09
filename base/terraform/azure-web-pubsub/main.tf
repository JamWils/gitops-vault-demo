terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.93"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "azapi_labs_eu_west" {
  name     = "azapi_labs_eu_west"
  location = "West US"
}

resource "azurerm_resource_group" "azapi_labs_us_east" {
  name     = "azapi_labs_us_east"
  location = "East US"
}