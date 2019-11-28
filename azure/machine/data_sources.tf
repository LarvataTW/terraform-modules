data "azurerm_resource_group" "az_resource_group" {
  name = "${var.resource_group}"
}

data "azurerm_virtual_network" "az_network" {
  name                = "${var.network}"
  location            = "${data.az_resource_group.location}"
  resource_group_name = "${data.az_resource_group.name}"
}

data "azurerm_subnet" "az_subnets" {
  for_each             = "${var.machines}"
  name                 = "${each.value.subnet}"
  resource_group_name  = "${data.az_resource_group.name}"
  virtual_network_name = "${data.az_network.name}"
}

# vim: filetype=terraform
