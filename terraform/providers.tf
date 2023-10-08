terraform {
  required_version = "1.5.7"
  backend "s3" {} ## Fallback from 1.6.0 to 1.5.7 due to security issue
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 2.9.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
  }
}

provider "linode" {
  token = var.linode_api_token
}
provider "docker" {}

provider "kubectl" {}

