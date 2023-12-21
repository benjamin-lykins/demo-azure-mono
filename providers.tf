terraform {
  required_version = ">= 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.11, < 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy               = false
      purge_soft_deleted_certificates_on_destroy = false
      purge_soft_deleted_keys_on_destroy         = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "173434b3-cfed-4dee-ba4a-708949505b87"
  client_id       = "6bca0206-ab27-46fe-a443-f9ae00664fd2"
  client_secret   = "UfP8Q~5sFtB7nIDBuPjlMb1J2~_.iOJcDlIz0a-_"
}
