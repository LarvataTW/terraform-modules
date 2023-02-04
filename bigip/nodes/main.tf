terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 0.13"
}

### Nodes

resource "bigip_ltm_node" "nodes" {
  for_each         = var.nodes
  name             = "/${var.tenant_name}/${each.value.name}"
  address          = each.value.address
  description      = each.value.description
  connection_limit = "0"
  dynamic_ratio    = "1"
  rate_limit       = "disabled"
  fqdn {
    address_family = "ipv4"
    interval       = "3000"
  }
}
