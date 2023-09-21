# terraform.tf or providers.tf
terraform {
  required_version = ">= 1.4, < 2.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {
  # Configuration options 222
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-platform"
}
