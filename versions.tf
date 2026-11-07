terraform {
  required_version = ">= 1.9.0"

  cloud {
    organization = "maryam-lab"

    workspaces {
      name = "entra-pipeline"
    }
  }

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.10"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
  }
}

provider "azuread" {}