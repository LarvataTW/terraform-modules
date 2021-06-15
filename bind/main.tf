resource "dns_a_record_set" "a_record" {
  for_each  = var.a_records
  zone      = var.zone
  name      = each.key
  addresses = each.value.ip
  ttl       = var.ttl
}

resource "dns_aaaa_record_set" "aaaa_record" {
  for_each  = var.aaaa_records
  zone      = var.zone
  name      = each.key
  addresses = each.value.ip
  ttl       = var.ttl
}

resource "dns_cname_record" "cname" {
  for_each = var.cnames
  zone     = var.zone
  name     = each.key
  cname    = format("%s.%s", each.value, var.zone)
  ttl      = var.ttl
}
