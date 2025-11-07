output "vm_names" {
  value = [for vm in proxmox_vm_qemu.terraform-learning : vm.name]
}

output "vm_ids" {
  value = [for vm in proxmox_vm_qemu.terraform-learning : vm.vmid]
}
