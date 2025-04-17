# 👤 How to Create a New User in Active Directory

This guide explains how to manually create a user account in Active Directory Users and Computers (ADUC) on your domain controller.

---

## 🧭 Steps

1. Open **Active Directory Users and Computers**
2. Navigate to the Organizational Unit (OU) where you want to place the user
3. Right-click the OU → select **New > User**
4. Fill in:
   - First name
   - Last name
   - User logon name (e.g., jdoe)
5. Click **Next**, then set a strong password
6. Check or uncheck:
   - "User must change password at next logon"
   - "Password never expires"
7. Click **Finish**

---

## 🔍 Verification

- The new user should appear in the OU
- Right-click the user → **Properties** to view details
- Log in with new credentials on a client machine

---

## 📷 Screenshot(s)

- `screenshots/ad_user_creation.png`
- `screenshots/ad_user_properties.png`
