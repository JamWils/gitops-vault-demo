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

resource "azurerm_resource_group" "azapi_labs_eu_west" {
  name     = "azapi_labs_eu_west"
  location = "West US"
}

resource "azurerm_web_pubsub" "example_eu_west" {
  name                = "tfex-webpubsub-eu-west"
  location            = azurerm_resource_group.azapi_labs_eu_west.location
  resource_group_name = azurerm_resource_group.azapi_labs_eu_west.name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = false

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }
}

resource "azurerm_resource_group" "azapi_labs_us_east" {
  name     = "azapi_labs_us_east"
  location = "East US"
}

resource "azurerm_web_pubsub" "example_us_east" {
  name                = "tfex-webpubsub-us-east"
  location            = azurerm_resource_group.azapi_labs_us_east.location
  resource_group_name = azurerm_resource_group.azapi_labs_us_east.name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = false

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }
}