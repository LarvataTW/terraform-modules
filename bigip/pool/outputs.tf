output "bigip_nodes" {
  description = "建立出來的 Nodes"
  value       = values(bigip_ltm_node.nodes)[*]
}

output "bigip_pool" {
  description = "建立出來的 Pool"
  value       = values(bigip_ltm_pool.pool)[*]
}
