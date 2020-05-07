### AS3 Template Builder

resource "bigip_as3" "as3" {
  tenant_name = var.tenant_name
  as3_json = templatefile(
    "${path.module}/templates/as3.tmpl",
    {
      as3_action               = jsonencode(var.as3_action)
      as3_id                   = jsonencode(var.as3_id)
      as3_label                = jsonencode(var.as3_label)
      as3_remark               = jsonencode(var.as3_remark)
      as3_application_name     = jsonencode(var.as3_application_name)
      as3_application_template = jsonencode(var.as3_application_template)
      as3_service_class        = jsonencode(var.as3_service_class)
      tenant_name              = jsonencode(var.tenant_name)
      pool_name                = jsonencode(var.pool_name)
      pool_mode                = jsonencode(var.pool_mode)
      pool_description         = jsonencode(var.pool_description)
      node_port                = jsonencode(var.node_port)
      server_addresses         = jsonencode([for ip in var.node_addresses : "${ip}"])
      virtual_addresses        = jsonencode([for ip in var.virtual_server_addresses : "${ip}"])
    }
  )
}
