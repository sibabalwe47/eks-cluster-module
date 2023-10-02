terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "~> 3.1"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}
