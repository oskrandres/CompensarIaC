/*
Azure Firewall Policy
*/

param afwpName string
param location string

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' = {
  name: afwpName
  location: location
  properties: {
    sku: {
      tier: 'Standard'
    }
    threatIntelMode: 'Alert'
    threatIntelWhitelist: {
      fqdns: []
      ipAddresses: []
    }
  }
}
