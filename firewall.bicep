/*
Deploy Firewall
*/

param afwName string
param location string
param vnetName string
param subnetName string
param RGVnet string
param pipName string
param afwpName string
param zones array
param cr object
resource pip 'Microsoft.Network/publicIPAddresses@2024-01-01' existing = {
  name:pipName
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' existing = {
  name:vnetName
  scope:resourceGroup(RGVnet)
}

resource snet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' existing = {
  name:subnetName
  parent:vnet
}

resource afwp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name:afwpName
}

resource azureFirewalls_afw_eastus_001_name_resource 'Microsoft.Network/azureFirewalls@2024-01-01' = {
  name: afwName
  location: location
  zones:zones
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    threatIntelMode: 'Alert'
    additionalProperties: {}
    ipConfigurations: [
      {
        name: pipName
        properties: {
          publicIPAddress: {
            id: pip.id
          }
          subnet: {
            id: snet.id
          }
        }
      }
    ]
    networkRuleCollections: [for crs in range(0,length(cr.properties)): {
      name: cr.properties[crs].name
      properties:{
        priority: cr.properties[crs].priority
      }
    }
    ]
    applicationRuleCollections: []
    natRuleCollections: []
    firewallPolicy: {
      id: afwp.id
    }
  }
}
