resource "dns_a_record_set" "record" {
  for_each  = var.records
  zone      = var.zone
  name      = each.key
  addresses = [each.value]
  ttl       = 300
}
