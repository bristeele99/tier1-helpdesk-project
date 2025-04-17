# 🧩 How to Apply a Group Policy (GPO) to a User or Computer

This guide walks through applying a basic GPO in Active Directory, such as enforcing lock screen timeout.

---

## Example GPO: Auto-lock screen after 5 minutes of inactivity

---

## 🧭 Steps

1. Open **Group Policy Management Console (GPMC)**
2. Expand your domain (e.g., helpdesk.local)
3. Right-click **Group Policy Objects** → **New**
   - Name: `GPO_LockScreen`
4. Right-click the new GPO → **Edit**
5. Navigate to:
User Configuration > Administrative Templates > Control Panel > Personalization
6. Double-click **"Screen saver timeout"**
- Enable it and set to `300` seconds (5 minutes)
7. Link the GPO to the appropriate OU:
- Right-click OU → **Link an existing GPO**

---

## 🔍 Verification

- Run `gpupdate /force` on a client machine
- Wait or log off/on
- Confirm screen locks after 5 minutes

---

## 📷 Screenshot(s)

- `screenshots/gpo_lockscreen_settings.png`
- `screenshots/gpo_linked_to_ou.png`
