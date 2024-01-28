
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = file(".do/token")
}

variable "do_region" {
  type = map(string)
  default = {
    short = "fra"
    full = "fra1"
  }
}

resource "digitalocean_project" "laurcons" {
  name        = "Laurcons"
  environment = "Production"
  description = "Personal Stuff"
  is_default  = true
  purpose     = "Web Application"
}
