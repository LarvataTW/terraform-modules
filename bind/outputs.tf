output "a_records" {
  description = "建立的 DNS A 記錄"
  value       = dns_a_record_set.a_record[*]
}

output "aaaa_records" {
  description = "建立的 DNS AAAA 記錄"
  value       = dns_a_record_set.aaaa_record[*]
}

output "cnames" {
  description = "建立的 DNS CNAME 記錄"
  value       = dns_a_record_set.cname[*]
}
