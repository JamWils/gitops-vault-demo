terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mobile_labs_eu_west" {
  name     = "mobile_labs_eu_west"
  location = "West US"
}

resource "azurerm_web_pubsub" "mobile_api_eu_west" {
  name                = "tfex-mobile-api-eu-west"
  location            = azurerm_resource_group.mobile_labs_eu_west.location
  resource_group_name = azurerm_resource_group.mobile_labs_eu_west.name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = false

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }
}

resource "azurerm_resource_group" "mobile_labs_us_east" {
  name     = "mobile_labs_us_east"
  location = "East US"
}

resource "azurerm_web_pubsub" "mobile_us_east" {
  name                = "tfex-mobile-api-us-east"
  location            = azurerm_resource_group.mobile_labs_us_east.location
  resource_group_name = azurerm_resource_group.mobile_labs_us_east.name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = false

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }
}