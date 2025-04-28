# ✅ Simulated Tier 1 Help Desk Lab – Azure Project Checklist

This checklist tracks the full lifecycle of your IT support lab environment in Azure. You can check off tasks as you complete them to stay organized and on schedule.

---

## 📁 PHASE 1: Azure Setup

- [x] Create an Azure Free Account (pay as you go)
- [x] Create a Resource Group (`HelpDesk-Lab`)
- [x] Create a Virtual Network (`IT-Lab-VNet`)
- [x] Deploy a Windows Server 2022 VM (`DC-Server`)
- [x] Configure Public Inbound Ports for RDP
- [x] Connect to the VM via Remote Desktop (RDP)
- [x] Deploy a Windows 10/11 Client VM (`win10-client`)
- [x] Set client DNS to use DC-Server private IP
- [x] Join client to the `helpdesk.local` domain
- [x] Add domain users (e.g., ssmith, mlee) to Remote Desktop Users group (real-world roles only)

---

## 🧩 PHASE 2: Active Directory Domain Setup

- [x] Install Active Directory Domain Services (AD DS) and DNS
- [x] Promote the Server to a Domain Controller
- [x] Set internal domain name (e.g., `helpdesk.local`)
- [x] Create Organizational Units (OUs)
- [x] Create 4+ test user accounts
- [x] Create 2+ security groups (e.g., IT, HR, Managers)
- [x] Assign users to appropriate groups

---

## 💼 PHASE 3: Simulate Tier 1 Help Desk Tasks

- [x] Reset a user password
- [ ] Disable and re-enable a user account
- [ ] Add/remove a user from a group
- [x] Use `ipconfig`, `ping`, and `nslookup` from the command line
- [x] Set a static IP address on the server
- [x] Create and apply a Group Policy Object (e.g., lock screen after 5 minutes)
- [ ] Log 5+ simulated help desk tickets
- [x] Take screenshots of each step/fix

---

## 📚 PHASE 4: Documentation + Final Report

- [ ] Create a `/Documentation` folder for SOPs and guides
- [ ] Write “How to create a user in AD” guide
- [ ] Write “How to reset a user password” SOP
- [x] Write “How to join a machine to the domain” guide
- [x] Write “How to apply and verify a GPO” SOP
- [ ] Write Final Summary Report of Project Build
