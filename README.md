# Systems-Engineer-Portfolio

Portfolio project demonstrating systems engineering skills: ITIL processes, monitoring, automation with Python &amp; PowerShell, Azure/VMware IaC, Citrix telemetry analysis, and enterprise infrastructure support.

This repository demonstrates systems engineering skills in monitoring, automation, ITIL-driven service management, backup/redundancy strategies, and enterprise infrastructure support.

It includes Python & PowerShell scripting, Azure/VMware Infrastructure-as-Code, Prometheus/Grafana monitoring, Citrix telemetry analysis, and ITIL process templates.

 ## Overview

Monitoring & Observability – Prometheus + Grafana dashboards, Azure Monitor workbooks.

ITIL Processes – Incident, Request, Problem, Change templates + FastAPI ITSM mini-app.

Automation – PowerShell DSC & scripts for Windows services; Python scripts for synthetic checks and Citrix telemetry parsing.

Cloud & Virtualization – Terraform configs for Azure and VMware vSphere (mock configs included).

Security & Backup – Snapshot/restore scripts for Azure + VMware, CIS baseline documentation.

Networking & Performance – TCP/IP diagnostics, synthetic probes, bottleneck simulation.

## Repository Structure
/docs               → Architecture diagrams, ITIL runbooks, PIR templates
/monitoring         → Prometheus + Grafana stack (docker-compose)
/itsm               → FastAPI mini ITSM system + CLI tools
/scripts
   ├─ powershell    → Service healers, backup scripts
   └─ python        → Synthetic checks, Citrix telemetry parser
/iac
   ├─ azure         → Terraform configs (VMs, Log Analytics, Monitor)
   └─ vmware        → Terraform vSphere configs, Packer templates
/security           → CIS baselines, key vault templates
/backup             → Snapshot + verify scripts

## Evidence Matrix

| Job Requirement | Repo Evidence |
|-----------------|---------------|
| Manage & monitor systems | `/monitoring/*`, Grafana dashboards, Azure workbooks |
| Daily ITSM usage | `/itsm/*` (FastAPI tickets, CLI clients), `/docs/runbooks` |
| OS install/config/maintain | `/scripts/powershell`, `/config/ansible`, DSC |
| Proactive performance & availability | `/scripts/python/synthetic_checks.py` |
| Security, backup, redundancy | `/backup/*`, `/security/*` |
| Automation/scripting | `/scripts/powershell`, `/scripts/python` |
| Citrix performance tuning | `/scripts/python/hdx_telemetry_parser.py` |
| Azure & VMware experience | `/iac/azure/*`, `/iac/vmware/*` |
| Networking knowledge | `/docs/networking/*`, iperf & packet capture notes |
