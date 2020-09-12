terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "cezarmathe"

    workspaces {
      name = "dns"
    }
  }
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
  required_version = ">= 0.13"
}

# Cloudflare provider
provider "cloudflare" {
  # Specified in the CLOUDFLARE_API_TOKEN environment variable.
  # api_token = ""
}

# Cloudflare zone
resource "cloudflare_zone" "main" {
  zone = "cezarmathe.com"
  plan = "free"
  type = "full"
}
