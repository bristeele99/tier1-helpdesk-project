# 🎫 Ticket #004 – Printer Not Responding  
**Date:** 2025-05-01  
**Reported by:** Mike Chan  
**System Name:** Win10-Desktop05  
**Reported Issue:**  
User reports that print jobs are not going through to the shared office printer (HP-LaserJet-02).

---

## 🔍 Troubleshooting Steps

1. Checked printer status via **Devices and Printers** – showed "Offline."  
2. Pinged printer IP `192.168.1.45` – no response.  
3. Physically checked printer – found it powered on but stuck on “Network initializing.”  
4. Restarted printer manually and ensured Ethernet cable was properly connected.  
5. After reboot, printer came online; test page sent successfully.

---

## ✅ Resolution

Printer came back online after manual power cycle. User confirmed printing is working again.

---

## 📌 Notes

- Recommended restarting the printer when unresponsive.  
- Logged printer event in device maintenance tracker.
