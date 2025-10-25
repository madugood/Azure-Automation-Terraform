# Terraform – Azure Infrastructure Automation

This repository contains the full configuration and scripts for Lab 02 of the CCGC 5502 Automation course. It covers three progressive modules using Terraform to provision and manage Azure infrastructure.

## 📚 Lab Overview

Lab 02 is divided into three sections:

- **Section 1:** Create, modify, and destroy basic Azure resources (VNet, subnets, NSGs)
- **Section 2:** Parameterize the configuration using variables and separate provider blocks
- **Section 3:** Expand the infrastructure by provisioning a Linux virtual machine

All configurations are tailored for macOS and executed via Terraform CLI and Azure CLI.

---

## 🧱 Folder Structure

```bash
lab02s1/                # Section 1: Flat configuration
  └── network-main.tf

lab02s2/                # Section 2: Parameterized configuration
  ├── providers.tf
  ├── network-vars.tf
  └── network-main.tf

lab02s3/                # Section 3: Linux VM provisioning
  ├── providers.tf
  ├── network-vars.tf
  ├── network-main.tf
  ├── vmlinux-vars.tf
  └── vmlinux-main.tf

⚙️ Prerequisites

macOS with Homebrew installed
Azure CLI (brew install azure-cli)
Terraform (brew install hashicorp/tap/terraform)
SSH key pair (ssh-keygen -t rsa -b 4096)
Azure subscription (free tier is sufficient)


🚀 Usage Instructions

🔹 Section 1: Flat Configuration
bash
cd lab02s1
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

🔹 Section 2: Parameterized Configuration
bash
cd lab02s2
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy

🔹 Section 3: Linux VM Provisioning
bash
cd lab02s3
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy

🧠 Key Concepts 

Provider and Terraform block separation
Resource group, virtual network, subnet creation
Network security group rules and associations
Variable abstraction and reuse
Linux VM provisioning with SSH authentication
Public IP and NIC configuration
Terraform state inspection and cleanup

📌 Notes

All resources are deployed to the Canada Central region.
Public IP uses Standard SKU due to free-tier limitations.
Ubuntu image used: Canonical:0001-com-ubuntu-server-jammy:22_04-lts-gen2:latest
SSH public key must be placed in the same folder or embedded as a variable.

🧼 Cleanup
Always destroy resources after testing to avoid unnecessary charges:

bash
terraform destroy

📄 License
This lab is part of the CCGC 5502 Automation course and is intended for educational use only.
