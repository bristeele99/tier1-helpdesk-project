# 👤 How to Create a New User in Active Directory

This guide explains how to manually create **Organizational Units (OUs)**, **user accounts**, and **security groups** in Active Directory Users and Computers (ADUC) on your domain controller.

---

## 🧭 Steps to Create Organizational Units (OUs)

1. Open **Active Directory Users and Computers**
2. Right-click your domain (e.g., `helpdesk.local`)
3. Select **New > Organizational Unit**
4. Enter a name (e.g., `IT`, `HR`, `Support`)
5. Click **OK**

### 🗂️ OUs Created:

- `IT`
- `HR`
- `Support`
- `Workstations`

📷 Screenshot: `screenshots/ou_creation.png`, `screenshots/ou_structure_created.png`

---

## 👤 Steps to Create Users

1. In **ADUC**, navigate to the OU where you want to create the user
2. Right-click the OU → select **New > User**
3. Fill in:
   - **First Name**: e.g., `John`
   - **Last Name**: e.g., `Doe`
   - **User logon name**: e.g., `jdoe`
4. Click **Next**
5. Set a strong password  
   Example: `P@ssw0rd!1234`
6. Choose password options:
   - ✅ "User must change password at next logon" *(recommended for real users)*
   - ❌ "Password never expires" *(optional)*
7. Click **Finish**

📷 Screenshot: `screenshots/ad_user_creation.png`, `screenshots/ad_user_and_computer_creation.png`

---

## 👥 Steps to Create Security Groups

1. Right-click the OU where the group should live (e.g., `IT`)
2. Select **New > Group**
3. Set:
   - **Name**: e.g., `IT_Admins`
   - **Group scope**: Global
   - **Group type**: Security
4. After creating, open **Properties > Members > Add...**
5. Add relevant users (e.g., `ssmith` to `IT_Admins`)

📷 Screenshot: `screenshots/security_groups_creation.png`

---

## 👤 Sample Users

| Username   | Full Name         | OU           | Group(s)         | Notes                                  |
|------------|------------------|--------------|------------------|----------------------------------------|
| jdoe       | John Doe          | HR           | HR_ReadOnly      | General HR user                        |
| rjones     | Rebecca Jones     | HR           | HR_ReadOnly      | Payroll specialist                     |
| khicks     | Kevin Hicks       | HR           | HR_ReadOnly      | Recruiter                              |
| ssmith     | Sarah Smith       | IT           | IT_Admins        | IT lead                                |
| dnguyen    | Diana Nguyen      | IT           | IT_Admins        | Systems administrator                  |
| eperez     | Elena Perez       | IT           | IT_Admins        | Security analyst                       |
| mlee       | Mike Lee          | Support      | Support_Level1   | Tier 1 help desk tech                  |
| cmorris    | Chris Morris      | Support      | Support_Level1   | Tier 1 help desk tech                  |
| ljames     | Lisa James        | Support      | Support_Level1   | Tier 2 support                         |
| bwalker    | Brandon Walker    | Support      | Support_Level1   | Night shift support                    |
| wkstn-01   | Workstation 01    | Workstations | None             | Machine-specific or dummy login        |
| wkstn-02   | Workstation 02    | Workstations | None             | Test workstation user                  |
| autolog1   | AutoLogin Agent   | Workstations | None             | Autologin for demo or shared terminal  |

---

## 👥 Security Groups Created

- `IT_Admins` (Global, Security)
- `HR_ReadOnly` (Global, Security)
- `Support_Level1` (Global, Security)

---

## 🔍 Verification

- Ensure new users appear under the correct OU
- Right-click user → **Properties** to verify info
- Ensure groups have the correct members
- Test user login on a domain-joined client machine

---

## 📷 Screenshot(s)

- `screenshots/ou_creation.png`
- `screenshots/ou_structure_created.png`
- `screenshots/ad_user_and_computer_creation.png`
- `screenshots/ad_user_creation.png`
- `screenshots/security_groups_creation.png`
