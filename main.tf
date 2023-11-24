# Configure aws provider
provider "aws" {
  region = "eu-west-2"
  profile = "Mr.Kachy"
}

# stores the terraform state file in s3
terraform {
  backend "s3" {
    bucket = "kach07-terraform-remote-state"
    key    = "terraform.tfstate.dev"
    region = "eu-west-2"
    profile = "Mr.Kachy"
  }
}