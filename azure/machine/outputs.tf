output "machines" {
  description = "建立出來的虛擬主機資料"
  value       = values(azurerm_virtual_machine.machine)[*]
}
