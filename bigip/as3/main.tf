### AS3 Template Builder

resource "bigip_as3" "as3" {
  tenant_name = var.tenant_name
  as3_json = templatefile(
    "as3.tmpl",
    {
      tenant_name       = jsonencode(var.tenant_name)
      virtual_addresses = jsonencode([for ip in var.virtual_server_addresses : "${ip}"])
      server_addresses  = jsonencode([for ip in var.node_addresses : "${ip}"])
    }
  )
}
