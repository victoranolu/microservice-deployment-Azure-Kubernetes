terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  
  features {}

}

# Configure backend and azure blob storage  
terraform {
  backend "azurerm" {
    resource_group_name  = var.storage_resource_group_name
    storage_account_name = var.storage_account_name 
    container_name       = var.container_name
    key                  = var.key
    use_oidc             = true
  }
}

# Configure the Azure Active Directory Providers
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

provider "azuread" {}

