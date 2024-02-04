terraform {
  required_version = "~> 1.2.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~>3.5.0"
    }
    oci = {
      source  = "hashicorp/oci"
    }
  }
}