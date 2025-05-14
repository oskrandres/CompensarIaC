
param location string = resourceGroup().location
param firewallName string
param publicIpName string
param vnetName string
param subnetName string
param policyName string
//param tags object

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: publicIpName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  //tags: tags
}

//esta parte de se debe ajustar para que incluya las reglas del json

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' = {
  name: policyName
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

resource firewall 'Microsoft.Network/azureFirewalls@2023-04-01' = {
  name: firewallName
  location: location
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    ipConfigurations: [
      {
        name: 'azureFirewallIpConfiguration'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
    firewallPolicy: {
      id: resourceId('Microsoft.Network/firewallPolicies', policyName)
    }
  }
  //tags: tags
}
