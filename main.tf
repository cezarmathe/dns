terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "cezarmathe"

    workspaces {
      name = "dns"
    }
  }
}

# Cloudflare module
module "cloudflare" {
  source = "./cloudflare"
}
