### Virtual Machines

resource "vsphere_virtual_machine" "virtual_machine" {
  for_each = var.machines

  name     = each.key
  num_cpus = each.value.num_cpus
  memory   = each.value.memory

  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastores[each.key].id
  guest_id         = data.vsphere_virtual_machine.templates[each.key].guest_id
  scsi_type        = data.vsphere_virtual_machine.templates[each.key].scsi_type
  folder           = var.folder

  network_interface {
    network_id   = data.vsphere_network.networks[each.key].id
    adapter_type = data.vsphere_virtual_machine.templates[each.key].network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = each.value.disk_size != "" ? each.value.disk_size : data.vsphere_virtual_machine.templates[each.key].disks.0.size
    thin_provisioned = var.linked_clone == "true" ? data.vsphere_virtual_machine.templates[each.key].disks.0.thin_provisioned : true
    eagerly_scrub    = var.linked_clone == "true" ? data.vsphere_virtual_machine.templates[each.key].disks.0.eagerly_scrub : false
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.templates[each.key].id
    linked_clone  = var.linked_clone

    customize {
      linux_options {
        host_name = each.key
        domain    = each.value.domain
        time_zone = var.time_zone != "" ? var.time_zone : "Asia/Taipei"
      }

      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = each.value.netmask
      }

      ipv4_gateway    = each.value.gateway
      dns_server_list = var.dns_servers
    }
  }
}
