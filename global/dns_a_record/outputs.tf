output "dns_record" {
  description = "建立的 DNS 記錄"
  value       = dns_a_record_set.record[*]
}
