# 🌐 Configure DNS & Join `win10-client` to Domain

This guide explains how to point your client VM to the domain controller for DNS resolution and join it to the `helpdesk.local` domain.

---

## 📍 Step 1: Configure DNS

1. In Azure → Go to `win10-client` → **Networking** → **Network Settings**
2. Click on the NIC name
3. Go to **DNS servers** under the Settings drop down on the left
4. Choose **Custom**
5. Set the DNS IP to the **private IP of `dc-server`** (e.g., `10.0.1.5`)
6. Click **Save**
7. Restart the `win10-client` VM from the Azure Portal

📷 Screenshot: `screenshots/set_dns_for_client.png`

---

## 📍 Step 2: Join the Domain

1. RDP into `win10-client` using `localadmin`
2. Open System Settings:
   - Run: `sysdm.cpl`
3. Click **Change settings** under computer name
4. Click **Change** → Select **Domain**
5. Enter:
`helpdesk.local`
6. When prompted, use domain credentials:
`Username: azureadmin` `Password: [your admin password]`

7. Reboot when prompted

📷 Screenshot: `screenshots/domain_join_success.png`

---

## 🛠️ Optional: Add DNS Suffix to Enable Short Name Resolution

If you're unable to resolve your domain controller by **hostname** (e.g., `dc-server`) but can resolve it by **FQDN** (e.g., `dc-server.helpdesk.local`), then your system may be missing a **DNS suffix search list**.

This suffix allows the system to automatically append the domain name when doing short-name lookups like `ping dc-server`.

### ✅ Fix: Add DNS Suffix to Search List

Run this PowerShell command as Administrator on the **client machine**:

```powershell
Set-DnsClientGlobalSetting -SuffixSearchList @("helpdesk.local")
```

## 📋 Explanation:
- This command tells Windows to append `helpdesk.local` to all unqualified hostnames
- For example, `ping dc-server` will internally try `dc-server.helpdesk.local`

## 🧪 Test After Applying
```cmd
nslookup dc-server
ping dc-server
```

### Expected output:
`Name: dc-server.helpdesk.local
Address: 10.0.1.5`

## ✅ Post-Join Tasks

- Login as a domain user (e.g., `helpdesk\jdoe`)
- Run:
```cmd
gpupdate /force
```
## ✅ Confirm GPO Settings Apply

Wait 5 minutes of inactivity to verify the auto-lock screen GPO takes effect

## 📷 Screenshot

- `screenshots/gpo_applied_on_client.png`
