# Startup Bicep Template: Secure Virtual Network

## Overview
This template provisions a secure Azure Virtual Network (VNet) for a startup, including a subnet and a Network Security Group (NSG). It is designed to follow the Azure Well-Architected Framework and Zero Trust principles.

## Why This Design?
- **Virtual Network (VNet):** Provides network isolation and a private address space for your cloud resources. Tags for `environment` and `owner` support operational excellence and cost management.
- **Subnet:** Segments the VNet for logical separation of workloads. Attaching an NSG at the subnet level enforces security boundaries.
- **Network Security Group (NSG):** Implements Zero Trust by denying all inbound traffic by default. You can add rules to allow only trusted sources as needed. This minimizes attack surface and enforces least privilege.

## Well-Architected Framework Alignment
- **Reliability:** Resource naming and tagging make management and automation easier.
- **Security:** NSG denies all inbound traffic by default. No public IPs are assigned. Tags help with identity and access management.
- **Cost Optimization:** Minimal configuration for a startup; only essential resources are provisioned.
- **Operational Excellence:** Tags for environment and owner support resource tracking and automation.
- **Performance Efficiency:** Default address space is scalable for future needs.

## Zero Trust Principles
- **No public IPs by default:** All resources are private unless explicitly exposed.
- **Restrictive NSG rules:** Only allow traffic from trusted sources. Deny all others.
- **Tagging:** Supports identity, access management, and automation.

## Next Steps
- Add more NSG rules for trusted sources as your needs evolve.
- Add more subnets for different workloads (e.g., web, database, management).
- Integrate with Azure Firewall or other security services for advanced scenarios.

---
For questions or customization, see comments in `main.bicep` or ask for guidance.
