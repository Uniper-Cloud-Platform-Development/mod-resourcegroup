terraform {
  required_version = ">= 1.5.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Importing the Azure naming module to ensure resources have unique CAF compliant names.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = " >= 0.4.0"
}

module "regions" {
  source  = "Azure/regions/azurerm"
  version = ">= 0.3.0"
}

# This allows us to randomize the region for the resource group.
resource "random_integer" "region_index" {
  max = length(module.regions.regions) - 1
  min = 0
}

module "resource_group" {
  source = "../../"
  # location = module.regions.regions[random_integer.region_index.result].name
  # name     = module.naming.resource_group.name_unique
  location = "westeurope"
  name     = "rg-weu-poc-plteng-05"
  tags = {
    # "hidden-title" = "This is visible in the resource name"
    # Environment    = "Non-Prod"
    # Role           = "DeploymentValidation"
    "application_name"   = "Testing # 1.0"
    "eam_id"             = "203196"
    "lob_parent"         = "Information Technology"
    "owner_email"        = "S49123@uniper.energy"
    "environment"        = "INT"
    "notification_email" = "uit-cmc-automation-services@uniper.energy"
  }
}