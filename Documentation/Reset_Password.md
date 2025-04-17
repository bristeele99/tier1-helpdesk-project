# 🛠️ How to Reset a User Password in Active Directory

This guide walks through resetting a user’s password using Active Directory Users and Computers (ADUC) on a domain controller.

---

## 📍 Prerequisites

- Logged in to the domain controller
- Active Directory Users and Computers installed
- Proper permissions (e.g., Domain Admin or Help Desk role)

---

## 🧭 Steps

1. Open **Active Directory Users and Computers**
2. Navigate to the correct Organizational Unit (OU)
3. Right-click the user's name and choose **Reset Password**
4. Enter the new password and confirm
5. Ensure "User must change password at next logon" is checked (optional)
6. Click **OK**

---

## 🧪 Validation

- Ask the user to log in with the new password
- Ensure login is successful via local machine or RDP

---

## 🔒 Best Practices

- Use complex passwords
- Encourage users to change their password after login
- Document the reset in your ticketing system

---

## 📷 Screenshot(s)

- `screenshots/reset_password_aduc.png`


ping 8.8.8.8
nslookup google.com
tracert google.com
