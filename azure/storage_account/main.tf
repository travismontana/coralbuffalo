provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"

  subscription_id = file("/home/bob/shell/.azure/subscription_id") 
  tenant_id       = file("/home/bob/shell/.azure/tenant_id")
}

