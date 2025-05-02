# 🎫 Ticket #002 – User Needs to Reset Their Password  
**Date:** 2025-05-01  
**Reported by:** John Doe  
**System Name:** Win10-Client01  
**Reported Issue:**  
User reports that they cannot remember their password this morning and is unable to log in.

---

## 🔍 Troubleshooting Steps

1. Navigated to **Active Directory Users and Computers (ADUC)** – located the user account `jdoe`.  
2. Right-clicked the account and selected **Reset Password**.  
3. Entered a temporary secure password ("Temporary!1") and ensured **“User must change password at next logon”** was checked.  
4. Informed the user of the temporary password and confirmed they were able to log in successfully.

---

## ✅ Resolution

Password was successfully reset via Active Directory. User was able to log in and change their password at next login.
- **Result:** User able to log in successfully  
- **Time to Resolve:** 10 minutes
---

## 📌 Notes

- Confirmed no account lockout had occurred.  
- Verified user identity via internal procedures before performing reset.  
- Ticket closed as resolved.

## 📷 Screenshot(s)

- `screenshots/jdoe_ticket2_fix.png`
- `screenshots/jdoe_ticket2_fix_anotherway.png`