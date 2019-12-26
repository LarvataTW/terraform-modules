data "azurerm_resource_group" "az_resource_group" {
  name = "${var.resource_group}"
}

data "azurerm_virtual_network" "az_network" {
  name                = "${var.network}"
  resource_group_name = "${data.azurerm_resource_group.az_resource_group.name}"
  depends_on          = [data.azurerm_resource_group.az_resource_group]
}

data "azurerm_subnet" "az_subnets" {
  for_each             = "${var.machines}"
  name                 = "${each.value.subnet}"
  resource_group_name  = "${data.azurerm_resource_group.az_resource_group.name}"
  virtual_network_name = "${data.azurerm_virtual_network.az_network.name}"
  depends_on           = [data.azurerm_virtual_network.az_network]
}

# vim: filetype=terraform
