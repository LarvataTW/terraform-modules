output "virtual_machines" {
  description = "建立出來的虛擬主機資料"
  value       = values(vsphere_virtual_machine.virtual_machine)[*]
}
