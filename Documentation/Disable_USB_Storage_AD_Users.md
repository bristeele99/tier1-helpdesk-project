# 🖥️ How to Disable USB Storage for Active Directory Users

## ✅ Step 1: Create a Group Policy (GPO) to Block USB Storage

1. On your **Domain Controller** (DC-Server):
   - Open **Group Policy Management**:

     ```bash
     gpmc.msc
     ```

2. **Create a GPO**:
   - Right-click your domain (or a specific OU) ➔ **Create a GPO** ➔ Name it:
     ```
     Block USB Storage Devices
     ```

3. **Edit the GPO**:
   - Navigate to:

     ```
     Computer Configuration ➔ Policies ➔ Administrative Templates ➔ System ➔ Removable Storage Access
     ```

4. **Enable these settings**:
   - **All Removable Storage classes: Deny all access** ➔ Set to **Enabled**.

5. **Link the GPO** to the correct **OU** where your target users or computers are located.

6. On the client machine, force a Group Policy update:

   ```bash
   gpupdate /force
   ```

---

## 🛡️ Which Users/Computers Should Have USB Disabled?

| Who | Why |
|:---|:---|
| Regular end users (non-admins) | Prevent malware infections, data theft, and accidental leaks |
| Sensitive departments (e.g., HR, Finance) | They handle confidential data |
| Shared or kiosk computers | Prevents plugging in unauthorized or infected USBs |
| Anyone without a business need | Default to deny, only allow by exception |

✅ **Admins and IT staff** might need USB, so **do not apply this policy to the Admins OU**.

---

## ⚠️ Important Notes

- This GPO blocks **USB storage** devices but **does not block** keyboards, mice, or printers.
- Always **test** on a small group before pushing it to your whole domain.
- Consider creating a **"USB Allowed Users"** OU with **no USB block** for exceptions.

---

# 🚀 Bonus: PowerShell Script to Disable USB Storage via Registry

This PowerShell script sets the registry to disable USB storage devices:

```powershell
# PowerShell Script: Disable USB Storage
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 4

# Explanation:
# 3 = USB storage enabled
# 4 = USB storage disabled
```

✅ You can run this manually or push it via GPO scripts or remote management tools.

---

# ✅ Quick Summary

- Create GPO ➔ Deny all removable storage access.
- Apply to OUs that contain non-admin users.
- Exclude IT/Admins if needed.
- (Optional) Push registry changes via PowerShell for extra lockdown.
