output "bigip_nodes" {
  description = "建立出來的 Nodes"
  value       = bigip_ltm_node.nodes
}

output "bigip_pool" {
  description = "建立出來的 Pool"
  value       = bigip_ltm_pool.pool
}
