### Nodes

resource "bigip_ltm_node" "nodes" {
  for_each         = var.nodes
  name             = "/${tenant_name}/${each.key}"
  address          = "${each.value.address}"
  description      = "${each.value.description}"
  connection_limit = "0"
  dynamic_ratio    = "1"
  rate_limit       = "disabled"
  fqdn {
    address_family = "ipv4"
    interval       = "3000"
  }
}

### Pool

resource "bigip_ltm_pool" "pool" {
  name                = "/${tenant_name}/${var.pool_name}"
  load_balancing_mode = "${var.pool_mode}"
  description         = "${var.pool_description}"
  monitors            = ["/Common/gateway_icmp"]
  allow_snat          = "yes"
  allow_nat           = "yes"
}

### Attach Nodes to a Pool

resource "bigip_ltm_pool_attachment" "node-pool-attach" {
  for_each = var.nodes
  pool     = bigip_ltm_pool.pool.name
  node     = "/${tenant_name}/${each.key}:${each.value.port}"
  depends_on = [
    bigip_ltm_node.nodes,
    bigip_ltm_pool.pool
  ]
}
