
// Central Subcription

module "central" {
  source = "git::https://github.com/infraweave-io/terraform-azure-infraweave-central.git?ref=v0.0.85"

  region = "westeurope"

  providers = {
    azurerm = azurerm.central
  }

  environment = local.environment

  all_regions           = local.all_regions
  all_workload_projects = local.all_workload_projects
}

provider "azurerm" {
  alias = "central"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = local.central_subscription_id
}
