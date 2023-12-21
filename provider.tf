terraform {
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.11.0, <4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "173434b3-cfed-4dee-ba4a-708949505b87"
  tenant_id       = "ab2e4aa2-3855-48b9-8d02-619cee6d9513"
}

provider "random" {}
