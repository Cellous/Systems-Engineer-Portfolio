# Systems-Engineer-Portfolio

This project is designed as a portfolio showcase for Systems Engineer roles, demonstrating practical skills in enterprise infrastructure support, monitoring, automation, cloud services, and ITIL-aligned operations.

Portfolio highlights include:

 - ITIL processes and service management

 - Monitoring & observability with Prometheus, Grafana, and Azure Monitor

 - Infrastructure-as-Code with Terraform (Azure & VMware)

 - Automation with PowerShell DSC and Python scripts

 - Security, backup, and redundancy strategies

## Getting Started
Clone the repository:

  git clone https://github.com/Cellous/Systems-Engineer-Portfolio.git

  cd Systems-Engineer-Portfolio

 Requirements:

  - Docker (for Prometheus/Grafana monitoring stack)

  - Python 3.9+

  - PowerShell 7+

  - Terraform CLI
 
## Key Skills Demonstrated

 - ITIL Service Management – Incident, Request, Problem, and Change processes

 - Infrastructure-as-Code (IaC) – Azure Monitor & VMware vSphere via Terraform

 - Monitoring & Observability – Prometheus + Grafana dashboards, Azure Monitor workbooks

 - Automation – PowerShell DSC, backup scripts, and Python synthetic checks

 - Security & Compliance – CIS baselines, backup/restore scripts, redundancy planning

 - Networking & Performance – TCP/IP diagnostics, packet captures, bottleneck simulations
 
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
| Daily ITSM usage | `/itsm/*`, `/docs/runbooks` |
| OS install/config/maintain | `/scripts/powershell`, DSC |
| Proactive performance & availability | `/scripts/python/synthetic_checks.py` |
| Security, backup, redundancy | `/backup/*`, `/security/*` |
| Automation/scripting | `/scripts/powershell`, `/scripts/python` |
| Citrix performance tuning | `/scripts/python/hdx_telemetry_parser.py` |
| Azure & VMware experience | `/iac/azure/*`, `/iac/vmware/*` |
| Networking knowledge | `/docs/networking/*`, iperf & packet capture notes |

## Screenshots (Coming Soon)

 - Grafana dashboards for system performance

 - ITSM FastAPI ticketing app UI

 - Example PowerShell service healer in action
 
 ## License
 This project is licensed under the MIT License – see the `LICENSE` file for details.
 
 ## Overview

Monitoring & Observability – Prometheus + Grafana dashboards, Azure Monitor workbooks.

ITIL Processes – Incident, Request, Problem, Change templates + FastAPI ITSM mini-app.

Automation – PowerShell DSC & scripts for Windows services; Python scripts for synthetic checks and Citrix telemetry parsing.

Cloud & Virtualization – Terraform configs for Azure and VMware vSphere (mock configs included).

Security & Backup – Snapshot/restore scripts for Azure + VMware, CIS baseline documentation.

Networking & Performance – TCP/IP diagnostics, synthetic probes, bottleneck simulation.




