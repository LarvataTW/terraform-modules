terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 0.13"
}

### Local variables
### https://www.daveperrett.com/articles/2021/08/19/nested-for-each-with-terraform/

locals {
  node_pools = distinct(flatten([
    for node in var.nodes : [
      for pool in var.pools : {
        pool = pool.name
        port = pool.port
        node = node.name
      }
    ]
  ]))
}

### Pool

resource "bigip_ltm_pool" "pools" {
  for_each            = var.pools
  name                = "/${var.tenant_name}/${each.value.name}"
  load_balancing_mode = each.value.mode
  description         = each.value.description
  monitors            = ["/Common/gateway_icmp"]
  allow_snat          = "yes"
  allow_nat           = "yes"
}

### Attach Nodes to a Pool

resource "bigip_ltm_pool_attachment" "node-pool-attach" {
  for_each   = { for entry in local.node_pools : "${entry.node}.${entry.pool}" => entry }
  pool       = "/${var.tenent_name}/${each.value.pool}"
  node       = "/${var.tenant_name}/${each.value.node}:${each.value.port}"
  depends_on = [bigip_ltm_pool.pools]
}
