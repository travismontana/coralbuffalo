provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.44.0"

  subscription_id = file("/home/bob/shell/.azure/subscription_id") 
  tenant_id       = file("/home/bob/shell/.azure/tenant_id")
}

resource "azurerm_resource_group" "cbhomedirs_rg" {
  name = "cbhomedirs_rg"
  location = "South Central US"
}

resource "azurerm_storage_account" "cbhomedirs_sa" {
  name = "cbhomedirs_sa"
  resource_group_name = azurerm_resource_group.cbhomedirs_rg.name
  location = azurerm_resource_group.cbhomedirs_rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = "${merge(module.cbtagging.coralbuffalo_common_tags_output)}"
}

module "cbtagging" {
  source = "git::https://github.com/travismontana/coralbuffalo.git//shared/cbtag"
  Organization = "Coral Buffalo"
  Owner = "Bob Bomar"
  Application = "home dirs"
  Environment = "production"
  ShapshotEnabled = "false"
  AppVersion = "1.0"
  TaggingVersionID = "1.0"
}