output "vm_names" {
  value = [for vm in proxmox_vm_qemu.My_ProxMox : vm.name]
}

output "vm_ids" {
  value = [for vm in proxmox_vm_qemu.My_ProxMox : vm.vmid]
}
