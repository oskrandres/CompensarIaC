param location string
param policyName string
/*param ruleCollectionGroups array*/

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
              '/ipg-secuty-privte-azvnet-dvl-i,/ipg-secuty-privte-azvnet-tst-i,/ipg-secuty-privte-azvnet-prp-i,/ipg-secuty-privte-azvnet-prd-i,/ipg-secuty-privte-azvnet-trv-i,/ipg-secuty-privte-azvnet-poc-i'
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

/*
resource ruleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2021-02-01' = [for rcg in ruleCollectionGroups: {
name: rcg.name
  parent: firewallPolicy
  properties: {
    priority: rcg.priority
    ruleCollections: rcg.ruleCollectionGroups
  }
}
*/
