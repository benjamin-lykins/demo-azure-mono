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
  subscription_id = "16d750eb-6d45-404c-a06a-a507a663be9e"
  client_id       = "5866b99f-adbe-4745-8792-141d5b70dccd"
  client_secret   = "moV8Q~fj3JDcgAnH8ePBYd5VGiL3-fwkQgkBWa0Q"
  tenant_id       = "ab2e4aa2-3855-48b9-8d02-619cee6d9513"
}
