
resource "proxmox_vm_qemu""My_ProxMox" {
  count       = var.vm_count
  vmid        = var.vmid + count.index
  onboot      = true
  vm_state    = "running"
  agent       = 1
  name        = "${var.base_name}-${count.index + 1}"
  target_node = var.target_node
  clone_id    = var.vm_template_id
  full_clone  = true
  memory      = 1024
  scsihw      = "virtio-scsi-single"
  boot        = "order=scsi1;ide2;net0"
  os_type     =  "cloud-init"
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  ciupgrade    = true
  sshkeys   = file("./ssh.keys")

  ipconfig0  = var.ipconfig
  searchdomain = "local"
  nameserver   = "8.8.8.8"      

  # CPU configuration
  cpu {
    cores   = 1
    sockets = 1
    type    = "host"
  }


  # Serial Block
  serial {
    id = 0
    type = "socket"
  }

  # VGA configuration
  vga {
    type = "serial0"
  }
  
  # Disk configuration
  disk {
    slot     = "scsi1"
    type     = "disk"
    storage  = "VMs"
    size     = "63G"
  }

  # cloudinit disk
  disk {
  slot    = "ide2"
  type    = "cloudinit"
  storage = "VMs"
  size    = "4G"  # size of the Cloud-Init drive
 }

  # Network adapter
  network {
    id    = 0
    model = "virtio"
    bridge = "vmbr0"
  }

  

}
