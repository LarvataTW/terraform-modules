resource "dns_a_record_set" "a_record" {
  for_each  = local.a_records
  zone      = local.zone
  name      = each.key
  addresses = each.value.ip
  ttl       = local.ttl
}

resource "dns_aaaa_record_set" "aaaa_record" {
  for_each  = local.aaaa_records
  zone      = local.zone
  name      = each.key
  addresses = each.value.ip
  ttl       = local.ttl
}

resource "dns_cname_record" "cname" {
  for_each = local.cnames
  zone     = local.zone
  name     = each.key
  cname    = format("%s.%s", each.value, local.zone)
  ttl      = local.ttl
}
