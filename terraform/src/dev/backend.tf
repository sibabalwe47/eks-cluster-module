terraform {
  backend "s3" {
    bucket         = "eks-plusone-x"
    key            = "eks/module/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "TerrastateLock"
  }
}

