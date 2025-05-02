# 🎫 Ticket #005 – Screen Doesn’t Auto-Lock  
**Date:** 2025-05-01  
**Reported by:** Lisa Turner  
**System Name:** Win11-Laptop08  
**Reported Issue:**  
User reports that her laptop screen is not locking automatically after inactivity, despite security policy.

---

## 🔍 Troubleshooting Steps

1. Verified user Group Policy settings for **Interactive Logon > Machine Inactivity Limit**.  
2. Found local setting overridden – timeout was set to “Never.”  
3. Ran `gpupdate /force` to reapply Group Policy settings from the domain.  
4. Restarted system and confirmed auto-lock occurs after 5 minutes of inactivity.

---

## ✅ Resolution

System was forced to reapply domain policy. Screen now auto-locks as expected after inactivity.

---

## 📌 Notes

- Informed user not to change screen saver/power settings manually.  
- Logged resolution for compliance auditing.
