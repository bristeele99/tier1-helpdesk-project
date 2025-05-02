# 🧩 Installing AD DS and Promoting Domain Controller

This document explains how Active Directory Domain Services (AD DS) was installed on the DC-Server and how it was promoted to a domain controller in Azure.

---

## 🛠️ Role Installation

- Server Manager → Add Roles and Features
- Roles added:
  - Active Directory Domain Services (AD DS)
- DNS was installed automatically during promotion
- Reboot not required until after domain promotion

**📷 Screenshots:**
- `add_roles_ad_ds.png`

---

## 👑 Domain Controller Promotion

- Deployment type: **New Forest**
- Domain Name: `helpdesk.local`
- Forest and Domain Functional Level: Windows Server 2016
- DSRM password set
- DNS configured automatically (checkbox selected)
- Global Catalog enabled (default)
- Server rebooted automatically after promotion

**📷 Screenshots:**
- `promote_server_to_dc.png`
- `domain_name_helpdesk_local.png`
- `dc_promotion_success.png`

---

## 🔍 Login After Reboot

- **Domain:** `helpdesk`
- **Login format:** `helpdesk\azureadmin`

---

## ❗ Issue: logonui.exe Stack-Based Buffer Overrun

### Problem:
After installing AD DS and DNS roles and promoting the VM to a Domain Controller, the system rebooted and displayed a logonui.exe system error.

### Cause:
This often occurs when the **internal private IP is not set to static** before promotion. DNS registration becomes unstable and causes login process failure.

### Fix:

1. Used Azure **Serial Console**
2. Logged in with local admin:
   - Username: `azureadmin`
   - Domain: `.`
3. Opened command session in SAC:
SAC> cmd SAC> ch -sn Cmd0001
4. Ran the following:
```cmd
dism /online /Disable-Feature /FeatureName:AD-Domain-Services
dism /online /Disable-Feature /FeatureName:DNS
shutdown /r /t 0
```
5. Rebooted VM  
6. Set static internal IP in Azure  
7. Reinstalled AD DS and promoted to Domain Controller again  

**📷 Screenshots:**
- `logonui_crash_warning.png`
- `serial_console_repair.png`
- `set_static_ip_page.png`

---

## ❗ Issue: DWM Crash / GUI Unresponsive / Start Menu Broken

### ❌ Error Message:
`Your session was logged off because DWM crashed.`

---

### ⚠️ Symptoms:
- Start menu wouldn't open or would freeze  
- Task Manager wouldn't launch  
- Desktop crashed or refreshed repeatedly  

---

### 🧠 Cause:
DWM (Desktop Window Manager) crashed due to:
- File system or image corruption
- RAM exhaustion during DISM repair
- GUI instability from domain promotion errors

---

### 🛠️ Fix (Command-Line Recovery):
1. Opened CMD from Server Manager  
2. Ran the following commands:
   ```cmd
   sfc /scannow
   DISM /Online /Cleanup-Image /RestoreHealth
   shutdown /r /t 0
✅ sfc successfully repaired issues
❌ DISM failed with:
`Error 14: Not enough memory resources are available to complete this operation.`

### 🔁 Resolution

- Resized the VM to **Standard B1ms** to increase RAM from **1 GiB → 2 GiB**
- After reboot, system was stable again

**📷 Screenshots:**
- `cli_recovery.png`
- `image_resize_troubleshoot.png`

---

### ✅ Lessons Learned

- Always create a snapshot before promoting a domain controller  
- Set the private internal IP to static before domain promotion  
- Avoid installing DNS manually — let AD DS handle it during promotion  
- Use SAC and Serial Console for recovery when the GUI fails  
- B1s may not provide enough memory for post-promotion repairs — consider B1ms or B2s temporarily

---

**📷 Screenshots:**
- `add_roles_ad_ds.png`
- `promote_server_to_dc.png`