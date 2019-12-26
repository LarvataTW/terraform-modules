### Network Interfaces

resource "azurerm_network_interface" "az_network_interfaces" {
  for_each            = "${var.machines}"
  name                = "${each.key}-nic"
  location            = "${data.azurerm_resource_group.az_resource_group.location}"
  resource_group_name = "${data.azurerm_resource_group.az_resource_group.name}"
  depends_on          = [data.azurerm_subnet.az_subnets]

  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = "${data.azurerm_subnet.az_subnets[each.key].id}"
    private_ip_address_allocation = "Static"
    private_ip_address            = "${each.value.ip}"
  }
}

### Machines

resource "azurerm_virtual_machine" "machine" {
  for_each              = "${var.machines}"
  name                  = "${each.key}"
  vm_size               = "${each.value.vm_size}"
  location              = "${data.azurerm_resource_group.az_resource_group.location}"
  resource_group_name   = "${data.azurerm_resource_group.az_resource_group.name}"
  network_interface_ids = ["${azurerm_network_interface.az_network_interfaces[each.key].id}"]
  depends_on            = [azurerm_network_interface.az_network_interfaces]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.os.publisher}"
    offer     = "${var.os.offer}"
    sku       = "${var.os.sku}"
    version   = "${var.os.version}"
  }
  storage_os_disk {
    name              = "osdisk0"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  dynamic "storage_data_disk" {
    for_each = each.value.disks
    content {
      name              = "${each.key}"
      create_option     = "Empty"
      managed_disk_type = "Standard_LRS"
      lun               = "${each.value.lun}"
      disk_size_gb      = "${each.value.size}"
    }
  }
  os_profile {
    computer_name  = "${each.key}"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.environment}"
  }
}
