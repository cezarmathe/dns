# DNS records for my website

resource "cloudflare_record" "github_a_1" {
  zone_id = cloudflare_zone.main.id
  name    = "cezarmathe.com"
  value   = "185.199.111.153"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "github_a_2" {
  zone_id = cloudflare_zone.main.id
  name    = "cezarmathe.com"
  value   = "185.199.110.153"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "github_a_3" {
  zone_id = cloudflare_zone.main.id
  name    = "cezarmathe.com"
  value   = "185.199.109.153"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "github_a_4" {
  zone_id = cloudflare_zone.main.id
  name    = "cezarmathe.com"
  value   = "185.199.108.153"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "github_cname" {
  zone_id = cloudflare_zone.main.id
  name    = "www"
  value   = "cezarmathe.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
