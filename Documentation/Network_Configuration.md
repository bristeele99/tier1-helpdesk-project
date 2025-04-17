# 🌐 Virtual Network & Subnet Configuration

This document outlines the network configuration used in the Azure-based Tier 1 Help Desk lab.

---

## ☁️ Virtual Network (VNet)

- **Name:** IT-Lab-VNet  
- **Resource Group:** HelpDesk-Lab  
- **Region:** Australia East 
- **Address Space:** `10.0.0.0/16`  
- **Purpose:**  
  Provides an isolated cloud network environment for all lab virtual machines and resources.

---

## 🔶 Subnet Configuration

- **Name:** DefaultSubnet  
- **Address Range:** `10.0.1.0/24`  
- **CIDR Size:** /24 (256 IP addresses)  
- **Usable Range:** `10.0.1.4` to `10.0.1.254` *(Azure reserves 3 IPs at the start)*  
- **Purpose:**  
  This subnet is used to host virtual machines in the simulated help desk environment. It includes:
  - Windows Server 2022 Domain Controller
  - Windows 10 Client

---

## 🧠 Why this matters

- The `/16` CIDR block allows for future expansion (more subnets)
- Subnets help logically separate resources and can be assigned NSGs (firewalls)
- Keeping track of subnet IPs helps with troubleshooting and IP assignment planning

---

## 📷 Screenshots

- `screenshots/vnet_config_summary.png`
- `screenshots/vnet_subnet_10_0_1.png`
