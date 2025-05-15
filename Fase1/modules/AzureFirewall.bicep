
param location string = resourceGroup().location
param publicFirewallIPName string
param firewallPolicyName string
param tags object
param zones array
param firewallVnet string
param firewallSubnet string

// Parametros de la IP Publica
resource publicIp 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: publicFirewallIPName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: zones
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  tags: tags
}

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' = {
  name: firewallPolicyName
  location: location
  properties: {
    sku: {
      tier: 'Premium'
    }
    dnsSettings: {
      enableProxy: true
      requireProxyForNetworkRules: true
      servers: []
    }
    threatIntelMode: 'Alert'
    threatIntelWhitelist: {
      fqdns: []
      ipAddresses: []
    }
  }
}


module afw 'AzureFirewallPolicy.bicep' = {
  name: 'AzureFirewallDeploy'
  scope: resourceGroup()
  params: {
    firewallPolicyName: firewallPolicyName
  }

  dependsOn: [
    afp
  ]
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' existing = {
  name:firewallVnet
  scope:resourceGroup()
}

resource snet 'Microsoft.Network/virtualNetworks/subnets@2024-01-01' existing = {
  name:firewallSubnet
  parent:vnet
}

resource firewall 'Microsoft.Network/azureFirewalls@2024-01-01' = {
  name: firewallPolicyName
  location: location
  tags: tags
  zones:zones
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Premium'
    }
    threatIntelMode: 'Alert'
    additionalProperties: {}
    ipConfigurations: [
      {
        name: publicIp.name
        properties: {
          publicIPAddress: {
            id: publicIp.id
          }
          subnet: {
            id: snet.id
          }
        }
      }
    ]
    firewallPolicy: {
      id: afp.id
    }
  }

  dependsOn: [
    vnet
    snet
  ]
}
