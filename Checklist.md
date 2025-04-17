# ✅ Simulated Tier 1 Help Desk Lab – Azure Project Checklist

This checklist tracks the full lifecycle of your IT support lab environment in Azure. You can check off tasks as you complete them to stay organized and on schedule.

---

## 📁 PHASE 1: Azure Setup

- [X] Create an Azure Free Account (pay as you go)
- [X] Create a Resource Group (`HelpDesk-Lab`)
- [X] Create a Virtual Network (`IT-Lab-VNet`)
- [X] Deploy a Windows Server 2022 VM (`DC-Server`)
- [X] Configure Public Inbound Ports for RDP
- [X] Connect to the VM via Remote Desktop (RDP)

---

## 🧩 PHASE 2: Active Directory Domain Setup

- [X] Install Active Directory Domain Services (AD DS) and DNS
- [X] Promote the Server to a Domain Controller
- [X] Set internal domain name (e.g., `helpdesk.local`)
- [ ] Create Organizational Units (OUs)
- [ ] Create 5+ test user accounts
- [ ] Create 2+ security groups (e.g., IT, HR, Managers)
- [ ] Assign users to appropriate groups

---

## 💼 PHASE 3: Simulate Tier 1 Help Desk Tasks

- [ ] Reset a user password
- [ ] Disable and re-enable a user account
- [ ] Add/remove a user from a group
- [ ] Use `ipconfig`, `ping`, and `nslookup` from the command line
- [ ] Set a static IP address on the server
- [ ] Create and apply a Group Policy Object (e.g., lock screen after 5 minutes)
- [ ] Log 5+ simulated help desk tickets
- [ ] Take screenshots of each step/fix

---

## 📚 PHASE 4: Documentation + Final Report

- [ ] Create a `/Documentation` folder for SOPs and guides
- [ ] Write “How to create a user in AD” guide
- [ ] Write “How to reset
