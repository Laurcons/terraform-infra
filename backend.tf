
terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    shared_credentials_files = [".aws/credentials"]
    bucket                   = "laurcons-terraform-state"
    key                      = "default-env.tfstate"
    region                   = "eu-central-1"
    profile                  = ""
    encrypt                  = "true"
  }
}
