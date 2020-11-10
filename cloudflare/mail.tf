# Mail configuration for https://www.fastmail.com.

# ----- cezarmathe.com -----

# MX record #1.
resource "cloudflare_record" "mx1_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "cezarmathe.com"
  value    = "in1-smtp.messagingengine.com"
  type     = "MX"
  ttl      = 1
  priority = 10
}

# MX record #2.
resource "cloudflare_record" "mx2_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "cezarmathe.com"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  ttl      = 1
  priority = 20
}

# CNAME record #1.
resource "cloudflare_record" "cname1_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "fm1._domainkey.cezarmathe.com"
  value    = "fm1.cezarmathe.com.dkim.fmhosted.com"
  type     = "CNAME"
  proxied  = false
  ttl      = 1
}

# CNAME record #2.
resource "cloudflare_record" "cname2_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "fm2._domainkey.cezarmathe.com"
  value    = "fm2.cezarmathe.com.dkim.fmhosted.com"
  type     = "CNAME"
  proxied  = false
  ttl      = 1
}

# CNAME record #3.
resource "cloudflare_record" "cname3_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "fm3._domainkey.cezarmathe.com"
  value    = "fm3.cezarmathe.com.dkim.fmhosted.com"
  type     = "CNAME"
  proxied  = false
  ttl      = 1
}

# TXT record.
resource "cloudflare_record" "txt_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "cezarmathe.com"
  value    = "v=spf1 include:spf.messagingengine.com ?all"
  type     = "TXT"
  ttl      = 1
}

# ------------------------------
