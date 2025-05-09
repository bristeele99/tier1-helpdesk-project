# ✅ 1. Apply a Test GPO to the Workstations OU

Let’s apply a simple GPO that will visibly confirm it's working — for example, we’ll display a legal banner on logon.

## 🛠 Steps to Create and Link the GPO:
1. On your Domain Controller, open Group Policy Management

2. Right-click the Workstations OU → Create a GPO in this domain, and Link it here…

3. Name it something like: Workstation - Legal Banner

4. Right-click the new GPO > Edit

## 🔒 Configure the Banner:
Navigate to:
`Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > Security Options`

Set:

Interactive logon: Message title for users attempting to log on → e.g., `Helpdesk Notice`

Interactive logon: Message text for users attempting to log on → e.g., `Unauthorized access is prohibited. All activity may be monitored.`

5. Close the editor and run:
`gpupdate /force`

on your WIN10 client (or reboot it) to test.

## ✅ You should now see a banner before login — this confirms the Workstations OU GPO is applying correctly.

## 📸 Screenshots

- `screenshots/GPO_interactive_logon_policy1.png`
- `screenshots/GPO_interactive_logon_policy2.png`


# 📜 2. Add a Script to Log Which Computer a User Logs In From
We’ll use a Logon Script via GPO to write the username and computer name to a central text file on your Domain Controller (or shared folder).

📁 Prep Shared Log Folder:
1. On your Domain Controller, create a folder like:
`C:\LoginLogs`
2. Share it:

- Right-click > Properties > Sharing tab > Advanced Sharing

- Share as `LoginLogs`

- Give Authenticated Users or Domain Computers `Write` permission

| ssmith     | Sarah Smith       | IT           | IT_Admins        | IT lead                                |
| dnguyen    | Diana Nguyen      | IT           | IT_Admins        | Systems administrator                  |
| eperez     | Elena Perez       | IT           | IT_Admins        | Security analyst                       |
| mlee       | Mike Lee          | Support      | Support_Level1   | Tier 1 help desk tech                  |
| cmorris    | Chris Morris      | Support      | Support_Level1   | Tier 1 help desk tech                  |
| ljames     | Lisa James        | Support      | Support_Level1   | Tier 2 support                         |
| bwalker    | Brandon Walker    | Support      | Support_Level1   | Night shift support                    |

## 🛡️ Also Set NTFS (Security) Permissions:
- Still in the folder Properties, go to the Security tab

- Click Edit → Add:

- Authenticated Users

- Give them Modify or at least Write access

Now the path is: `C:\LoginLogs`

## 📸 Screenshots

- `screenshots/sharing_logfolder.png`

🧾 Create the Logon Script:
1. Open Notepad and paste:
`@echo off
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /C:"IPv4 Address"') do (
    set ip=%%A
)
set ip=%ip:~1%

echo %username%,%computername%,%ip%,%date%,%time% >> \\DC-Server\LoginLogs\logons.csv`

2. Save as:
`logonscript.bat`
3. Place this script in:
`C:Windows\SYSVOL\sysvol\helpdesk.local\scripts\`

## 🛡️ Add the Logon Script via Group Policy
## 📍 Steps:
1. Open Group Policy Management on DC-Server

- You can find it by searching for gpmc.msc

2. Expand your domain (e.g., helpdesk.local)

3. Right-click an appropriate GPO:

- ✅ You can use Default Domain Policy

- Or create a new GPO like Logon Logging for better organization:

- Right-click the domain > Create a GPO in this domain, and Link it here…

- Name it Logon Logging

4. Right-click the GPO > Edit

## 📝 Add the Script

5. In the Group Policy Management Editor, navigate to:
`User Configuration > Policies > Windows Settings > Scripts (Logon/Logoff) > Logon`
6. Double-click Logon > click Add…

7. Click Browse…

-This will open the scripts folder:
``\\helpdesk.local\SYSVOL\helpdesk.local\scripts\`

- Select your script: logonscript.bat

8. Click OK > then OK again to close the dialog

 ## 🧪 Logon Script Test Procedure

### ✅ Prerequisites

Ensure the following are completed before testing:

- `logonscript.bat` is saved in:
`C:\Windows\SYSVOL\sysvol\helpdesk.local\scripts\`
- The script logs to:

### ✅ Prerequisites

- The `LoginLogs` folder is shared and `Authenticated Users` have **Write** permission (Share + NTFS)
- The script is linked to a GPO (e.g., `Default Domain Policy` or custom `Logon Logging` GPO)
- The GPO is applied to OUs containing **user accounts** (e.g., HR, IT, Support)
- You have:
  - At least one **domain user** (e.g., `jdoe`)
  - A domain-joined **client machine** (e.g., `WIN10CLIENT`)

---

### 🧭 Steps to Test

1. **On the client machine (`WIN10CLIENT`)**:
   - Log off any existing user
   - Log in as a domain user (e.g., `jdoe`, `mlee`, etc.)

2. **On the Domain Controller (`DC-Server`)**:
   - Open the file:

     ```
     C:\LoginLogs\logons.csv
     ```

3. ✅ Confirm the file contains a new entry like:

jdoe,WIN10CLIENT,192.168.0.25,04/21/2025,10:58:41.45

## 📸 Screenshots

- `screenshots/GPO_LogonLogging_Confirmation.png`

---

### 🛠️ Troubleshooting

| Issue                         | Solution                                                              |
|------------------------------|-----------------------------------------------------------------------|
| File doesn't exist or is empty | Check if the user has write access to the `LoginLogs` share           |
| Script doesn’t run           | Verify GPO is linked to the correct OU containing the **user**        |
| GPO not applying             | Run `gpresult /r` or `gpupdate /force` on the client machine           |
| Script path not resolving    | Confirm the script is in the correct SYSVOL `scripts` folder           |


Ran into 
"Network access is denied"
Or
"The system cannot access the file path"

This will often flash very quickly during login, or get logged if verbose GPO logging is enabled.
For C:\Windows\SYSVOL\sysvol\helpdesk.local\scripts\

## 🛠️ Troubleshooting: "Network Access is Denied" When Logon Script Runs

If you see a **"Network access is denied"** error during logon — especially pointing to the script path or the `LoginLogs` share — it's likely a **permissions issue**.

---

### 🧭 What's Likely Happening?

Your logon script tries to write to:
If the domain user doesn’t have permission to **access or write** to that folder, the script will fail and trigger a "network access" error.

---

### ✅ Step-by-Step Fix

#### 🔒 1. Check Share Permissions on `LoginLogs`

1. On your Domain Controller (`DC-Server`), right-click the folder `C:\LoginLogs` > **Properties**
2. Go to the **Sharing** tab > click **Advanced Sharing**
3. Check ✅ **"Share this folder"** is enabled
4. Click **Permissions**
5. Ensure `Authenticated Users` or `Domain Users` are listed
6. ✅ Grant them **Change** and **Read** permissions

> ❗ "Read" only won't allow log file creation — "Change" is required.

---

#### 🛡️ 2. Check NTFS (Security) Permissions on the Folder

1. Still in the `C:\LoginLogs` folder's **Properties** window, go to the **Security** tab
2. Click **Edit**
3. Add `Authenticated Users` or `Domain Users` if missing -(This fixed the problem)
4. ✅ Grant **Modify**, **Read & Execute**, and **Write** permissions

---

#### 🧪 3. Test User Access from the Client

1. Log in to your domain-joined client (e.g., `WIN10CLIENT`) as a domain user (e.g., `jdoe`)
2. Press `Windows + R` → Type:

3. ✅ Confirm that:
   - The folder opens successfully
   - You can create a test file (e.g., `test.txt`) inside

---

#### 🧼 4. Optional Debug: Test Local Script Execution

Temporarily edit your `logonscript.bat` to include:

```batch echo %username% > C:\Temp\testlog.txt ```

## Screenshots 
- `Screenshots/GPO_logon_script_troubleshoot.png`
