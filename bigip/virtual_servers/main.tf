terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
  required_version = ">= 0.13"
}

### Virtual Server

resource "bigip_ltm_virtual_server" "virtual_servers" {
  for_each    = var.virtual_servers
  name        = "/${var.tenant_name}/${each.value.name}"
  description = each.value.description
  destination = each.value.destination
  port        = var.pools["${each.value.default_pool}"].port
  pool        = "/${var.tenant_name}/${var.pools["${each.value.default_pool}"].port}"
}
