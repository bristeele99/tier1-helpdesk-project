# 💻 Deploying `win10-client` VM in Azure

This guide covers the deployment of a Windows 10 client virtual machine in Azure for domain join, GPO testing, and help desk simulation.

---

## ✅ VM Configuration

| Setting         | Value                   |
|----------------|-------------------------|
| Name           | `win10-client`          |
| OS Image       | Windows 10 Pro or Enterprise |
| Resource Group | `HelpDesk-Lab`          |
| Virtual Network| `IT-Lab-VNet`           |
| Subnet         | `10.0.1.0/24` (same as DC) |
| Size           | B2s or B1ms             |
| Admin Username | `localadmin`            |
| Public IP      | Static                  |
| Inbound Ports  | RDP (3389)              |

---

## 🧭 Deployment Steps

1. Go to Azure Portal → **Create a resource**
2. Select **Windows 10 Pro/Enterprise**
3. Fill in basic details (see table above)
4. Select existing **VNet** and **Subnet** (same as `dc-server`)
5. Enable RDP under Inbound Port Rules
6. Click **Review + Create** → **Create**

---

## 🖥️ Post-Deployment

- Connect to VM using RDP:
  - Download `.rdp` file from Azure Portal
  - Login:  
    ```
    Username: localadmin  
    Password: [set during deployment]
    ```

📷 Screenshots
- `screenshots/win10_client_deployed.png`
- `screenshots/rdp_to_client_success.png`
