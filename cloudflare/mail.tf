# Mail configuration

resource "cloudflare_record" "box_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "box.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "mx_box_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "box.cezarmathe.com"
  value   = "box.cezarmathe.com"
  type    = "MX"
  ttl     = 1
  proxied = false
}
