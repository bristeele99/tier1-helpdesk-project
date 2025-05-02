# 🧩 How to Apply a Group Policy (GPO) to a User or Computer

This guide walks through creating and applying a **Group Policy Object (GPO)** in Active Directory to enforce a security setting — in this case, automatically locking the screen after 5 minutes of inactivity.

---

## 🎯 Example GPO: Auto-lock screen after 5 minutes of inactivity

---

## 🧭 Steps

1. Open **Group Policy Management Console (GPMC)**
   - Server Manager → Tools → Group Policy Management

2. Expand your domain (e.g., `helpdesk.local`)

3. Right-click the target **Organizational Unit (OU)** (e.g., `HR`)  
   Select:  
   **“Create a GPO in this domain, and Link it here...”**

   - Name the GPO: `HR - Auto Lock Policy`

4. In the left pane under **Group Policy Objects**, find your new GPO  
   Right-click it → **Edit**

5. In the **Group Policy Management Editor**, navigate to:  
`User Configuration → Policies → Administrative Templates → Control Panel → Personalization`

6. Configure the following settings:

- **Screen saver timeout**
  - Status: Enabled
  - Timeout: `300` (seconds)

- **Password protect the screen saver**
  - Status: Enabled

- **Force specific screen saver**
  - Status: Enabled
  - Screen saver executable: `scrnsave.scr`

---

## 🔁 Applying GPO to Specific Users

> GPOs apply to **all users or computers within the OU** where the GPO is linked.

- If you want the GPO to apply to `ssmith` or `mlee`, make sure their user accounts are placed inside the **same OU** where the GPO is linked (e.g., `HR`, `IT`, etc.)
- Alternatively, link the GPO to **multiple OUs** if needed.

### 🔒 (Optional) Security Filtering (Advanced)

If you want the GPO to apply only to selected users within the OU:
1. Go to the GPO → **Delegation → Advanced**
2. Remove `Authenticated Users`
3. Add the specific users (e.g., `ssmith`) and check **Allow: Apply Group Policy**

---

## 🔐 (Optional) Grant Remote Desktop Access to Domain Users

> Only users who need to log into remote machines (e.g., `ssmith`, `mlee`) should be granted RDP access. Regular users like `jdoe` do not need this.

### 🛠️ Method 1: PowerShell (Preferred on Client)

```powershell
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "helpdesk\ssmith"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "helpdesk\mlee"
```
### 🛠️ Method 2: Command Prompt
```cmd
net localgroup "Remote Desktop Users" "helpdesk\ssmith" /add
net localgroup "Remote Desktop Users" "helpdesk\mlee" /add
```
---
## 🔍 RDP Access Verification

Connect via RDP to the win-10 client machine and use login credentials for user "helpdesk\ssmith" and password "P@ssw0rd!1234" or whatever was set when account was created in AD.

## 🔍 Verification

1. On a domain-joined client machine, run:
```cmd
gpupdate /force
```
2. Either log off/on or wait 5 minutes without activity

3. The screen should automatically lock and require a password

4. Optionally, run:
```cmd
rsop.msc
```
## 📘 Notes

- This GPO applies to all users under the `HR` OU  
- Ensures devices lock automatically when unattended  
- Common real-world policy for HIPAA, NIST, or general IT compliance
- Only help desk or IT staff should be granted Remote Desktop access (e.g., ssmith, mlee)

---

## 📷 Screenshots

- `screenshots/open_gpm.png`
- `screenshots/create_gpo_autolock.png`
- `screenshots/gpo_settings_autolock.png`
