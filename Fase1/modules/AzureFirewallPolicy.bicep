param location string
param policyName string
// param ruleCollectionGroups array

resource firewallPolicy 'Microsoft.Network/firewallPolicies@2021-02-01' = {
  name: policyName
  location: location
  properties: {
    sku: {
      tier: 'Standard'
    }
  }
}

resource networkRuleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2022-01-01' = {
  parent: firewallPolicy
  name: 'DefaultNetworkRuleCollectionGroup'
  properties: {
    priority: 200
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        name: 'azure-global-services-nrc'
        priority: 1250
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'time-windows'
            ipProtocols: [
              'UDP'
            ]
            destinationAddresses: [
              '13.86.101.172'
            ]
            sourceIpGroups: [
              'AzureGlobalServices'
            ]
            destinationPorts: [
              '123'
            ]
          }
        ]
      }
    ]
  }
}
