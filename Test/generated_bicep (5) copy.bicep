
param firewallPolicyName string = 'afwp-afw-secuty-public-centrltrv-i'

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup()
}

resource afp_RCG_NET_AUDIT_SCAN 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-AUDIT-SCAN'
  properties: {
    priority: 9000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-testqa-jmeter-to-az-hosts'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
            ]
            sourceAddresses: [
              '10.204.5.240/28'
            ]
            destinationAddresses: [
              '10.89.20.0/22'
              '10.89.5.0/24'
            ]
            destinationPorts: [
              '139'
              '443'
              '445'
              '5671'
              '5672'
              '9093'
              '9400'
              '9401'
              '9402'
              '9403'
              '30143'
            ]
          }
        ]
        name: 'rc-op-performance-testing-to-az-vnets'
        priority: 110
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-soc-to-az-vnets'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
            ]
            sourceAddresses: [
              '192.168.173.161'
              '192.168.173.168'
              '192.168.173.169'
              '192.168.173.162'
            ]
            destinationIpGroups: [
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-dvl-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-tst-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prp-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prd-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-trv-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-engine-nexpose-to-az-vnets'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
            ]
            sourceAddresses: [
              '192.168.204.17'
              '192.168.204.246'
            ]
            destinationIpGroups: [
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-dvl-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-tst-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prp-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prd-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-trv-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-console-nexpose-to-az-vnets'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
            ]
            sourceAddresses: [
              '192.168.204.86'
            ]
            destinationIpGroups: [
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-dvl-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-tst-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prp-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-prd-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-trv-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroupscuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '*'
            ]
          }
        ]
        name: 'rc-op-vulnerability-scanner-to-az-vnets'
        priority: 100
      }
    ]
  }
}
