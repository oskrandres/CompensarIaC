resource firewallPolicy 'Microsoft.Network/firewallPolicies@2021-05-01' existing = {
  name: 'MyPolicy'}

resource ruleCollectionGroup 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2021-05-01' = {
  name: 'NetworkRuleCollectionGroup-MGMNT'
  parent: firewallPolicy
  properties: {
    priority: 2000
    ruleCollections: [
      {
        name: 'rule-op-vpn-globalprotect-to-az-spoke-transversal'
        priority: 115
        action: {
          type: 'Allow'
        }
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        rules: [
          {
            name: 'rule-op-vpn-globalprotectprisma-to-spokes-snet-management'
            ruleType: 'NetworkRule'
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            ipProtocols: [
              'TCP'
            ]
            destinationPorts: [
              '22'
              '443'
              '3389'
            ]
            destinationAddresses: [
              '10.200.60.0/27'
              '10.204.0.0/21'
            ]
          }
        ]
      }
    ]
  }
}
