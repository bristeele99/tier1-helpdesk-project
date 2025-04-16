# 🖥️ Deploying the Windows Server 2022 Domain Controller VM

This guide documents the steps used to create the domain controller virtual machine in Azure.

---

## 🔧 VM Configuration

- **VM Name:** DC-Server  
- **Resource Group:** HelpDesk-Lab  
- **Region:** Australia East  
- **Image:** Windows Server 2022 Datacenter  
- **Size:** B1s  
- **Admin Username:** azureadmin  
- **RDP Enabled:** Yes (Port 3389)

---

## 🌐 Network Settings

- **Virtual Network:** IT-Lab-VNet  
- **Subnet:** DefaultSubnet (10.0.1.0/24)  
- **Public IP:** Auto-assigned  
- **NSG Rules:** Inbound RDP (3389) allowed

---
## 🔐 Connecting to the VM via Remote Desktop (RDP)

After deploying the Windows Server 2022 VM, you can access it using Remote Desktop Protocol (RDP) to perform configurations and install services like Active Directory.

---

### 🧭 Steps to Connect via RDP

1. Go to your **Azure Portal** → Navigate to your VM (`DC-Server`)
2. In the left menu, click **“Connect” > "select" > “Native RDP” > "configure"**
3. Download the `.rdp` file provided by Azure
4. Open the `.rdp` file on your local machine
5. When prompted, enter:
   - **Username:** `azureadmin` (or the one you set)
   - **Password:** Your secure VM password
6. Click **"Yes"** to accept the certificate warning

---

### 🧠 Notes

- Ensure **port 3389 (RDP)** is allowed in your Network Security Group (NSG)
- If you're using a **dynamic public IP**, reconnect may fail after reboot
  - ⚠️ *In this project, we used a **static public IP** for consistency*

---

### 📷 Screenshot(s)

- `screenshots/rdp_connect_page.png`
- `screenshots/rdp_logged_in.png`

## 🔍 Notes

- This VM will be promoted to a Domain Controller in the next step.
- The public IP may change if the VM is stopped and restarted unless static IP is configured which in this project it is.

---

## 📷 Screenshots

- `vm_config_basic.png`
- `vm_config_basic2.png`
- `vm_image_selection.png`
- `vm_disks.png`
- `vm_networking_config.png`
- `vm_deployment_success.png`
- `vm_dashboard_overview.png`