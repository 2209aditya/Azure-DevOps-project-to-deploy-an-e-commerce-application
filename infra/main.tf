provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "rg" {
  name     = "ecomm-rg"
  location = "East US"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "ecomm-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "ecomm-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id
}
