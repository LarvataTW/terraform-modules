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
  pool_virtual_servers = distinct(flatten([
    for pool in var.pools : [
      for virtual_server in var.virtual_servers : {
        pool           = pool.name
        port           = pool.port
        virtual_server = virtual_server.name
        destination    = virtual_server.destination
        description    = virtual_server.description
      }
    ]
  ]))
}

### Virtual Server

resource "bigip_ltm_virtual_server" "vs" {
  for_each    = { for entry in local.node_pools : "${entry.node}.${entry.pool}" => entry }
  name        = "/${var.tenant_name}/${each.value.virtual_server}"
  description = each.value.description
  destination = each.value.destination
  port        = each.value.port
  pool        = "/${var.tenant_name}/${each.value.pool}"
}
