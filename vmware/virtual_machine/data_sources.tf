data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastores" {
  for_each      = var.machines
  name          = each.value.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "networks" {
  for_each      = var.machines
  name          = each.value.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "templates" {
  for_each      = var.machines
  name          = each.value.template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# vim: filetype=terraform

