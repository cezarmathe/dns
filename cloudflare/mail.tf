# Mail configuration for https://mailinabox.email

# ----- cezarmathe.com -----

# Provides email configuration autodiscovery support for Thunderbird Autoconfig.
resource "cloudflare_record" "autoconfig_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "autoconfig.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
}

# Provides email configuration autodiscovery support for Z-Push ActiveSync Autodiscover.
resource "cloudflare_record" "autodiscover_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "autodiscover.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
}

# Required. Specifies the hostname (and priority) of the machine that handles @cezarmathe.com mail.
resource "cloudflare_record" "mx_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "cezarmathe.com"
  value    = "box.cezarmathe.com"
  type     = "MX"
  ttl      = 1
  priority = 10
}

# Recommended. Specifies that only the box is permitted to send @cezarmathe.com mail.
resource "cloudflare_record" "txt1_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "cezarmathe.com"
  value    = "v=spf1 mx -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Specifies that mail that does not originate from the box but claims to be from
# @cezarmathe.com or which does not have a valid DKIM signature is suspect and should be
# quarantined by the recipient's mail system.
resource "cloudflare_record" "txt2_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.cezarmathe.com"
  value    = "v=DMARC1; p=quarantine"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Provides a way for recipients to verify that this machine sent @cezarmathe.com mail.
resource "cloudflare_record" "txt3_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "mail._domainkey.cezarmathe.com"
  value    = "v=DKIM1; h=sha256; k=rsa; s=email; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxZDBRsfeeJLbDvf18H/VzC4uAd0qNMNqy5e9zsMS58dQbHkb28rAyCN1BlbnkZcDzXXZ3LI88x7xRG840HvUp+YPFFLnloPSkOtIv/6jPvJj0Vw8xnuLmpeUkoTaAT92ykT8fekBVpLQg052DPxhDaWiFqT8QGjp5pBhaPLofpEgCZu/W5bBv0MuQeF2O01f+en1NPI6sQdq2BqCL2BwsDn8RwbBhiUUsyucaPgiXTK8KBBWMjtMts++SKNjvotVVNg7ska+NEcli5zSgwOSBS6IiDwBaJknOhXO3r12ML+C5vfgjJsfiwkvtyq/NtGkipV2ERCqDxJSN8Zwnkv8awIDAQAB"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that no servers are
# valid sources for mail from @autoconfig.box.cezarmathe.com. If you do send email from this domain
# name you should either override this record such that the SPF rule does allow the originating
# server, or, take the recommended approach and have the box handle mail for this domain (simply
# add any receiving alias at this domain name to make this machine treat the domain name as one of
# its mail domains).
resource "cloudflare_record" "txt4_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "www.cezarmathe.com"
  value    = "v=spf1 -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that the SPF rule
# should be honoured for mail from @autodiscover.box.cezarmathe.com.
resource "cloudflare_record" "txt5_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.www.cezarmathe.com"
  value    = "v=DMARC1; p=reject"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Specifies the hostname of the server that handles CardDAV/CalDAV services for email
# addresses on this domain.
resource "cloudflare_record" "srv1_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_caldavs._tcp.cezarmathe.com"
  type     = "SRV"
  ttl      = 1

  data = {
    service  = "_caldavs"
    proto    = "_tcp"
    priority = 0
    weight   = 0
    port     = 443
    target   = "box.cezarmathe.com"
  }
}

# Recommended. Specifies the hostname of the server that handles CardDAV/CalDAV services for email
# addresses on this domain.
resource "cloudflare_record" "srv2_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_carddavs._tcp.cezarmathe.com"
  type     = "SRV"
  ttl      = 1

  data = {
    service  = "_carddavs"
    proto    = "_tcp"
    priority = 0
    weight   = 0
    port     = 443
    target   = "box.cezarmathe.com"
  }
}

# --------------------------

# ----- box.cezarmathe.com -----

# Required. Sets the IP address of the box.
resource "cloudflare_record" "box_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "box.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
}

# Provides email configuration autodiscovery support for Thunderbird Autoconfig.
resource "cloudflare_record" "autoconfig_box_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "autoconfig.box.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
}

# Provides email configuration autodiscovery support for Z-Push ActiveSync Autodiscover.
resource "cloudflare_record" "autodiscover_box_cezarmathe_com" {
  zone_id = cloudflare_zone.main.id
  name    = "autodiscover.box.cezarmathe.com"
  value   = "165.22.92.132"
  type    = "A"
  ttl     = 1
}

# Required. Specifies the hostname (and priority) of the machine that handles @box.cezarmathe.com
# mail.
resource "cloudflare_record" "mx_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "box.cezarmathe.com"
  value    = "box.cezarmathe.com"
  type     = "MX"
  ttl      = 1
  priority = 10
}

# Recommended. Specifies that only the box is permitted to send @box.cezarmathe.com mail.
resource "cloudflare_record" "txt1_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "box.cezarmathe.com"
  value    = "v=spf1 mx -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Specifies that mail that does not originate from the box but claims to be from
# @box.cezarmathe.com or which does not have a valid DKIM signature is suspect and should be
# quarantined by the recipient's mail system.
resource "cloudflare_record" "txt2_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.box.cezarmathe.com"
  value    = "v=DMARC1; p=quarantine"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Provides a way for recipients to verify that this machine sent @box.cezarmathe.com
# mail.
resource "cloudflare_record" "txt3_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "mail._domainkey.box.cezarmathe.com"
  value    = "v=DKIM1; h=sha256; k=rsa; s=email; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxZDBRsfeeJLbDvf18H/VzC4uAd0qNMNqy5e9zsMS58dQbHkb28rAyCN1BlbnkZcDzXXZ3LI88x7xRG840HvUp+YPFFLnloPSkOtIv/6jPvJj0Vw8xnuLmpeUkoTaAT92ykT8fekBVpLQg052DPxhDaWiFqT8QGjp5pBhaPLofpEgCZu/W5bBv0MuQeF2O01f+en1NPI6sQdq2BqCL2BwsDn8RwbBhiUUsyucaPgiXTK8KBBWMjtMts++SKNjvotVVNg7ska+NEcli5zSgwOSBS6IiDwBaJknOhXO3r12ML+C5vfgjJsfiwkvtyq/NtGkipV2ERCqDxJSN8Zwnkv8awIDAQAB"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that no servers are
# valid sources for mail from @autoconfig.box.cezarmathe.com. If you do send email from this domain
# name you should either override this record such that the SPF rule does allow the originating
# server, or, take the recommended approach and have the box handle mail for this domain (simply
# add any receiving alias at this domain name to make this machine treat the domain name as one of
# its mail domains).
resource "cloudflare_record" "txt4_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "autoconfig.box.cezarmathe.com"
  value    = "v=spf1 -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that the SPF rule
# should be honoured for mail from @autodiscover.box.cezarmathe.com.
resource "cloudflare_record" "txt5_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.autoconfig.box.cezarmathe.com"
  value    = "v=DMARC1; p=reject"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that no servers are
# valid sources for mail from @autoconfig.box.cezarmathe.com. If you do send email from this domain
# name you should either override this record such that the SPF rule does allow the originating
# server, or, take the recommended approach and have the box handle mail for this domain (simply
# add any receiving alias at this domain name to make this machine treat the domain name as one of
# its mail domains).
resource "cloudflare_record" "txt6_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "autodiscover.box.cezarmathe.com"
  value    = "v=spf1 -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that the SPF rule
# should be honoured for mail from @autodiscover.box.cezarmathe.com.
resource "cloudflare_record" "txt7_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.autodiscover.box.cezarmathe.com"
  value    = "v=DMARC1; p=reject"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that no servers are
# valid sources for mail from @autoconfig.box.cezarmathe.com. If you do send email from this domain
# name you should either override this record such that the SPF rule does allow the originating
# server, or, take the recommended approach and have the box handle mail for this domain (simply
# add any receiving alias at this domain name to make this machine treat the domain name as one of
# its mail domains).
resource "cloudflare_record" "txt8_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "ns1.box.cezarmathe.com"
  value    = "v=spf1 -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that the SPF rule
# should be honoured for mail from @autodiscover.box.cezarmathe.com.
resource "cloudflare_record" "txt9_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.ns1.box.cezarmathe.com"
  value    = "v=DMARC1; p=reject"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that no servers are
# valid sources for mail from @autoconfig.box.cezarmathe.com. If you do send email from this domain
# name you should either override this record such that the SPF rule does allow the originating
# server, or, take the recommended approach and have the box handle mail for this domain (simply
# add any receiving alias at this domain name to make this machine treat the domain name as one of
# its mail domains).
resource "cloudflare_record" "txt10_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "ns2.box.cezarmathe.com"
  value    = "v=spf1 -all"
  type     = "TXT"
  ttl      = 1
}

# Recommended. Prevents use of this domain name for outbound mail by specifying that the SPF rule
# should be honoured for mail from @autodiscover.box.cezarmathe.com.
resource "cloudflare_record" "txt11_box_cezarmathe_com" {
  zone_id  = cloudflare_zone.main.id
  name     = "_dmarc.ns2.box.cezarmathe.com"
  value    = "v=DMARC1; p=reject"
  type     = "TXT"
  ttl      = 1
}

# # Optional. Provides an out-of-band method for verifying an SSH key before connecting. Use
# # 'VerifyHostKeyDNS yes' (or 'VerifyHostKeyDNS ask') when connecting with ssh.
# resource "cloudflare_record" "sshfp1_box_cezarmathe_com" {
#   zone_id  = cloudflare_zone.main.id
#   name     = "box.cezarmathe.com"
#   type     = "SRV"
#   ttl      = 1

#   data = {
#     algorithm   = 1
#     type        = 2
#     fingerprint = "743E0CBDA6022CC342B38868A5473D30264378A092CF2D310C69C3B4B9193003"
#   }
# }

# # Optional. Provides an out-of-band method for verifying an SSH key before connecting. Use
# # 'VerifyHostKeyDNS yes' (or 'VerifyHostKeyDNS ask') when connecting with ssh.
# resource "cloudflare_record" "sshfp2_box_cezarmathe_com" {
#   zone_id  = cloudflare_zone.main.id
#   name     = "box.cezarmathe.com"
#   type     = "SRV"
#   ttl      = 1

#   data = {
#     algorithm   = 3
#     type        = 2
#     fingerprint = "768DDB4EC7FFDD818EF454B1A09F019F0701071953DFCF8D99B8B88E9BE9CBA9"
#   }
# }

# # Optional. Provides an out-of-band method for verifying an SSH key before connecting. Use
# # 'VerifyHostKeyDNS yes' (or 'VerifyHostKeyDNS ask') when connecting with ssh.
# resource "cloudflare_record" "sshfp3_box_cezarmathe_com" {
#   zone_id  = cloudflare_zone.main.id
#   name     = "box.cezarmathe.com"
#   type     = "SRV"
#   ttl      = 1

#   data = {
#     algorithm   = 4
#     type        = 2
#     fingerprint = "25A4E0821B34D048419EE213FC46824FD05A0A02AB8B6BCAF7F3AF22F37795AD"
#   }
# }

# # Recommended when DNSSEC is enabled. Advertises to mail servers connecting to the box that
# # mandatory encryption should be used.
# resource "cloudflare_record" "tlsa1_box_cezarmathe_com" {
#   zone_id  = cloudflare_zone.main.id
#   name     = "_25._tcp.box.cezarmathe.com"
#   type     = "SRV"
#   ttl      = 1

#   data = {
#     usage         = 3
#     selector      = 1
#     matching_type = 1
#     certificate   = "b1eab7c1da5f74401a99c2bfa0ad620be38c26db64370abc3be1779fb4af7ca0"
#   }
# }

# # Optional. When DNSSEC is enabled, provides out-of-band HTTPS certificate validation for a few web clients that support it.
# resource "cloudflare_record" "tlsa2_box_cezarmathe_com" {
#   zone_id  = cloudflare_zone.main.id
#   name     = "_443._tcp.box.cezarmathe.com"
#   type     = "SRV"
#   ttl      = 1

#   data = {
#     usage         = 3
#     selector      = 1
#     matching_type = 1
#     certificate   = "b1eab7c1da5f74401a99c2bfa0ad620be38c26db64370abc3be1779fb4af7ca0"
#   }
# }

# ------------------------------
