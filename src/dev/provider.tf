terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "eu-west-2"
  # profile = "eks.plusonex"
  # access_key = ""
  # secret_key = ""
  # #shared_credentials_files = "C:/Users/terraform/.aws/credentials"
}
