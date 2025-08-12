// main.bicep
// This Bicep template provisions a secure Azure Virtual Network (VNet) for a startup, following Well-Architected Framework and Zero Trust principles.
// Resources: VNet, Subnet, Network Security Group (NSG)
// Tags: environment, owner

param location string = resourceGroup().location
param vnetName string = 'startup-vnet'
param subnetName string = 'startup-subnet'
param nsgName string = 'startup-nsg'
param addressPrefix string = '10.0.0.0/16'
param subnetPrefix string = '10.0.0.0/24'
param environment string = 'dev'
param owner string = 'startup-team'

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  tags: {
    environment: environment
    owner: owner
  }
  properties: {
    addressSpace: {
      addressPrefixes: [addressPrefix]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: nsgName
  location: location
  tags: {
    environment: environment
    owner: owner
  }
  properties: {
    securityRules: [
      {
        name: 'DenyAllInbound'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      // Add more rules for trusted sources as needed
    ]
  }
}
