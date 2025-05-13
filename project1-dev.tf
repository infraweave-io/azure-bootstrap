
// Workload Subscription Project 1 (dev)

module "workload-project1-dev" {
  source = "git::https://github.com/infraweave-io/terraform-azure-infraweave-workload.git?ref=v0.0.85"

  region = "westeurope"

  providers = {
    azurerm = azurerm.workload-project1-dev
  }

  environment             = local.environment
  central_subscription_id = local.central_subscription_id

  all_regions           = local.all_regions
  all_workload_projects = local.all_workload_projects
}

provider "azurerm" {
  alias = "workload-project1-dev"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "11111111-1111-1111-1111-111111111111"
}
