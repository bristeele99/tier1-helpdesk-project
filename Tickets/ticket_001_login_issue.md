# 🎫 Ticket #001 – User Cannot Log In

**Date:** 2025-04-11  
**Reported by:** John Doe  
**System Name:** Win10-Client01  
**Reported Issue:**  
User reports being unable to log into their workstation this morning.

---

## 🔍 Troubleshooting Steps

1. Checked Active Directory – user account was **locked out**.
2. Verified password expiration status – password **had expired**.
3. Performed password reset in **Active Directory Users and Computers (ADUC)**.
4. Informed user and had them attempt login via RDP – successful.

---

## ✅ Resolution

- **Issue:** Password expired and account locked  
- **Action Taken:** Reset password and unlocked account  
- **Result:** User able to log in successfully  
- **Time to Resolve:** 12 minutes

---

## 📷 Screenshot(s)

- `screenshots/user_account_locked.png`
- `screenshots/ad_password_reset.png`

---

## 🧠 Notes

Consider setting up a GPO to notify users before password expiration.
