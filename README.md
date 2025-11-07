# terraform  
Infrastructure-as-Code for my Proxmox home-lab  
*(Repository by funmicra – DevOps / home-lab enthusiast)*  

## 🎯 Purpose  
This repo holds Terraform configuration to manage my home-lab virtualization infrastructure on Proxmox VE.  
It enables me to version-control VM/container definitions, networking, storage, and automation in a declarative way.  

## 🧰 Tech Stack & Scope  
- **Proxmox VE** as the virtualization platform (KVM + LXC).  
  See: 
  - [Proxmox VE documentation](https://pve.proxmox.com/pve-docs/) 
  - [Terraform Proxmox Provider](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)
- **Terraform** for Infrastructure-as-Code (IaC).  
- The Terraform provider for Proxmox, for example:  
  - The `telmate/proxmox` provider on Terraform Registry.
  - This repo is designed for my home network / lab context (see Site A and Site B in my network setup) but the patterns are reusable.

## 🚀 Quick Start  

1. Clone this repository:  
```bash
git clone https://github.com/funmicra/terraform.git
cd terraform
```
2. Copy the variables.tf.template to variables.tf and set your values (API endpoint, node name, datastores, credentials, etc).

3. Initialize Terraform:
```bash
terraform init
```
4. Review the plan:
```bash
terraform plan
```
5. Apply changes:
```bash
terraform apply
```
6. To tear-down (if needed):
```bash
terraform destroy
```
## 📂 Repository Layout
```bash
├── providers.tf          # defines provider(s) (Proxmox, etc)  
├── main.tf               # root module / resource definitions  
├── outputs.tf            # exported values  
├── variables.tf.template # template variables file (copy to variables.tf & fill in)  
├── .gitignore            # excludes Terraform state etc.  
└── …                     # additional modules/sub-folders as needed  
```
## 🧩 Use-Cases & Features

Some of the things I’m using this repo for:

- Provisioning new VMs and LXC containers on Proxmox automatically.

- Defining datastores, networks and virtual bridges in code.

- Enforcing version-control and auditability of infrastructure changes.

- Making the home-lab reproducible, portable, and self-documented.

## ⚠️ Known Considerations

- Some resources in the Proxmox provider (especially community-maintained ones) may have bugs or incomplete support. For example: one user reports that the telmate provider is limited in features compared to bpg. 
Proxmox Support Forum
+1

- In a home-lab environment TLS verification might be disabled (tls_insecure = true), but this is not recommended for production.

- Uploading files (ISO, cloud-init snippets) to certain storage types in Proxmox (e.g., LVM-thin) may fail; see blog post for practical caveats. 
Mark Tinderholt’s Blog.

- This repo assumes you already have a working Proxmox node / cluster and you know your datastores/network topology.

## ❓ Questions / Support

If you run into issues, check:

- The [Terraform Registry page](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs) for the provider you are using.

- The [GitHub](https://github.com/Telmate/terraform-provider-proxmox) issues for the provider repo.

- Forums or r/Proxmox for home-lab discussions. For example one thread explores which provider is best: 
Proxmox Support Forum

---
Thanks for checking out this project. Happy automation — **may your builds be reproducible and your state files stable.**
— funmicra