output "nodes" {
  description = "建立出來的 Nodes"
  value       = values(bigip_ltm_node.nodes)[*]
}

output "pool" {
  description = "建立出來的 Pool"
  value       = bigip_ltm_pool.pool
}
