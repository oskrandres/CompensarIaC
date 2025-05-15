
param firewallPolicyName string = 'test'

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
              'TCP,UDP,ICMP'
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
              'TCP,UDP,ICMP'
            ]
            sourceAddresses: [
              '192.168.173.161'
              '192.168.173.168'
              '192.168.173.169'
              '192.168.173.162'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-engine-nexpose-to-az-vnets'
            ipProtocols: [
              'TCP,UDP,ICMP'
            ]
            sourceAddresses: [
              '192.168.204.17'
              '192.168.204.246'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-console-nexpose-to-az-vnets'
            ipProtocols: [
              'TCP,UDP,ICMP'
            ]
            sourceAddresses: [
              '192.168.204.86'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
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

resource afp_RCG_NET_COMMON 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-COMMON'
  properties: {
    priority: 6000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-za-vnets'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '22'
              '53'
              '80'
              '135'
              '443'
              '1000'
              '1433'
              '2179'
              '2382'
              '2383'
              '3389'
              '6380'
              '6901'
              '6910'
              '8080'
              '8081'
              '8100'
              '9050'
              '9191'
              '10000-20000'
              '17012'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spokes-snet-db'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-db'
            ]
            destinationPorts: [
              '20000-30000'
              '40000-43000'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-devops-to-spokes-snet-db'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.225'
              '192.168.204.227'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-db'
            ]
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spokes-snet-psql-medpre'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            destinationAddresses: [
              '10.89.6.0/28'
              '10.89.134.0/28'
              '10.205.6.0/28'
              '10.203.6.0/28'
            ]
            destinationPorts: [
              '5432'
            ]
          }
        ]
        name: 'rc-az-vnets-to-devops-agent'
        priority: 130
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-az-dns'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmctrl'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-op-dns'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-internet-dns'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationAddresses: [
              '168.63.129.16'
              '1.1.1.1'
              '8.8.8.8'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-az-dnspr-netwrk-centrl-dnsppl-trv-i'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-az-dnspr-netwrk-centrl-dnsppl-trv-i-reverse'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-dnspr-netwrk-centrl-dnsppl-trv-i-to-op-domain-controllers'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceAddresses: [
              '10.204.2.0/25'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'
            ]
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-dnspr-netwrk-centrl-dnsppl-trv-i-to-op-domain-controllers-reverse'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'
            ]
            destinationAddresses: [
              '10.204.2.0/25'
            ]
            destinationPorts: [
              '53'
            ]
          }
        ]
        name: 'rc-az-vnets-to-dns-resolution'
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
            name: 'rule-az-vnets-to-az-domain-controllers'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'
            ]
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-az-domain-controllers-reverse'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-op-domain-controllers'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmctrl'
            ]
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-op-domain-controllers-reverse'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmctrl'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
        ]
        name: 'rc-az-vnets-to-domain-controllers'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-vnets-to-op-kav-antivirus'
            ipProtocols: [
              'TCP,UDP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationAddresses: [
              '192.168.204.71'
              '192.168.204.99'
            ]
            destinationPorts: [
              '80'
              '135'
              '445'
              '7271'
              '13000'
              '13111'
              '14000'
              '15000'
              '16000'
              '17000'
              '17111'
              '19000'
              '51000-52000'
            ]
          }
        ]
        name: 'rc-az-vnets-to-kav-antivirus'
        priority: 120
      }
    ]
  }
  dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
  ]
}

resource afp_RCG_NET_DVL_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-DVL-I'
  properties: {
    priority: 5000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-bibaf2-centrl-ingest-dvl-i-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.0/23'
            ]
            destinationAddresses: [
              '192.168.208.12'
              '192.168.208.57'
              '192.168.209.24'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-bibatr-bibaf2-centrl-dvl-i'
        priority: 160
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-dbw-financ-dkcart-transc-pub-dvl-i-to-op-vmdvaupes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.9.128/26'
            ]
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationPorts: [
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-dbw-financ-dkcart-transc-prv-dvl-i-to-op-vmdvaupes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.9.192/26'
            ]
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationPorts: [
              '445'
            ]
          }
        ]
        name: 'rc-rg-bibatr-financ-dkcart-dvl-i'
        priority: 170
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-ip-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            destinationAddresses: [
              '192.168.1.78/32'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-fqdn-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'esbintprutls.compensar.com'
            ]
          }
        ]
        name: 'rc-rg-csalud-medpre-transv-dvl-i'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-transc-dvl-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.12.32/27'
            ]
            destinationAddresses: [
              '192.168.20.238'
              '192.168.20.230'
            ]
            destinationPorts: [
              '1443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-trvmdm-dvl-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.13.96/28'
            ]
            destinationAddresses: [
              '192.168.20.238'
              '192.168.20.230'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-gclint-syncro-stream-dvl-i'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebxtdv-centrl-manage-dvl-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.20.0/22'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-ebxtdv-centrl-loadfs-dvl-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.201/32'
            ]
            destinationAddresses: [
              '10.89.5.0/24'
            ]
            destinationPorts: [
              '139'
              '443'
              '445'
            ]
          }
        ]
        name: 'rc-rg-mdmtrv-ebxtdv-centrl-dvl-i'
        priority: 140
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmdrhesb01-to-ip-apim-introp-apibus-manage-dvl-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.119'
            ]
            destinationAddresses: [
              '10.89.1.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmdrhesb01-to-fqdn-apim-introp-apibus-manage-dvl-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.119'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.dvlaz.compensar.int'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-apibus-dvl-i'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-centrl-manage-dvl-i-to-op-gclientespru'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.16.0/22'
            ]
            destinationAddresses: [
              '192.168.1.13'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-centrl-dvl-i'
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
            name: 'rule-asp-logsce-centrl-srvlog-dvl-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.13.160/27'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rc-rg-transv-logsce-centrl-dvl-i'
        priority: 130
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
  ]
}

resource afp_RCG_NET_INTERNET 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-INTERNET'
  properties: {
    priority: 7000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-snet-apim-to-azure-agent-apimgmnt-microsoftmetrics.com'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-apim'
            ]
            destinationAddresses: [
              '52.183.41.0/24'
              '13.92.0.0/16'
            ]
            destinationPorts: [
              '1886'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-snet-dbw-to-azure-agent-databricks-sql'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dbw'
            ]
            destinationAddresses: [
              '40.70.0.0/16'
            ]
            destinationPorts: [
              '1433'
              '3306'
              '9093'
            ]
          }
        ]
        name: 'rc-az-vnets-to-azure-resources-agents'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vnets-to-internet-small-ivory-gazelle.rmq3.cloudamqp.com'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationAddresses: [
              '20.110.121.0/24'
            ]
            destinationPorts: [
              '443'
              '5672'
            ]
          }
        ]
        name: 'rc-az-vnets-to-fqdn-internet'
        priority: 110
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
  ]
}

resource afp_RCG_NET_MGMT 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-MGMT'
  properties: {
    priority: 8000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-bastion-to-spokes-snet-dmz'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.7'
              '192.168.204.13'
              '192.168.204.112'
              '192.168.204.180'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmz'
            ]
            destinationPorts: [
              '22'
              '135'
              '443'
              '445'
              '1433'
              '1434'
              '3389'
              '5432'
              '5433'
              '8080'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-bastion-to-spokes-snet-app'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.7'
              '192.168.204.13'
              '192.168.204.112'
              '192.168.204.180'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-app'
            ]
            destinationPorts: [
              '22'
              '135'
              '443'
              '445'
              '1433'
              '1434'
              '3389'
              '5432'
              '5433'
              '8080'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-vnets'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '22'
              '443'
              '3389'
            ]
          }
        ]
        name: 'rc-op-vlans-to-az-vnets'
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
            name: 'rule-op-vpns-to-vnets'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            destinationPorts: [
              '22'
              '443'
              '3389'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpns-to-spokes-snet-dmz'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmz'
            ]
            destinationPorts: [
              '22'
              '443'
              '3389'
              '5671'
              '5672'
              '8080'
              '9093'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpns-to-spokes-snet-app'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-app'
            ]
            destinationPorts: [
              '22'
              '443'
              '3389'
              '5671'
              '5672'
              '8080'
              '9093'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpns-to-spokes-snet-db'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-db'
            ]
            destinationPorts: [
              '135'
              '139'
              '445'
              '1433'
              '1434'
              '4022'
              '5432'
              '5433'
              '6380'
              '11000-11999'
              '3389'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpns-to-spokes-snet-st'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-st'
            ]
            destinationPorts: [
              '135'
              '139'
              '445'
              '1433'
              '1434'
              '4022'
              '5432'
              '5433'
              '6380'
              '11000-11999'
              '3389'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpns-to-spokes-snet-aks'
            ipProtocols: [
              'TCP'
            ]
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-vpnsec'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-aks'
            ]
            destinationPorts: [
              '80'
              '443'
              '8080'
              '9400'
              '9401'
              '9402'
              '9403'
              '9404'
              '9408'
              '30143'
            ]
          }
        ]
        name: 'rc-op-vpns-to-az-vnets'
        priority: 100
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
  ]
}

resource afp_RCG_NET_PRD_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-PRD-I'
  properties: {
    priority: 2000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-bibaf2-centrl-ingest-prd-i-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.0/23'
            ]
            destinationAddresses: [
              '192.168.207.7'
              '192.168.207.19'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-bibatr-bibaf2-centrl-prd-i'
        priority: 160
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'dummy'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.0/24'
            ]
            destinationAddresses: [
              '10.1.0.0/24'
            ]
            destinationPorts: [
              '80'
            ]
          }
        ]
        name: 'rc-rg-bibatr-financ-dkcart-prd-i'
        priority: 170
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-ip-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.24.0/22'
            ]
            destinationAddresses: [
              '192.168.3.17/32'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-fqdn-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.24.0/22'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'esbintprdtls.compensar.com'
            ]
          }
        ]
        name: 'rc-rg-csalud-medpre-transv-prd-i'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-transc-prd-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.12.32/27'
            ]
            destinationAddresses: [
              '192.168.207.19'
              '192.168.207.20'
              '192.168.207.21'
              '192.168.207.23'
            ]
            destinationPorts: [
              '1443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-trvmdm-prd-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.13.96/28'
            ]
            destinationAddresses: [
              '192.168.207.19'
              '192.168.207.20'
              '192.168.207.21'
              '192.168.207.23'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-gclint-syncro-stream-prd-i'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebxtdv-centrl-manage-prd-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.20.0/22'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-ebxtdv-centrl-loadfs-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.207.124/32'
            ]
            destinationAddresses: [
              '10.203.5.0/24'
            ]
            destinationPorts: [
              '139'
              '443'
              '445'
            ]
          }
        ]
        name: 'rc-rg-mdmtrv-ebxtdv-centrl-prd-i'
        priority: 140
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprhesbbw01-to-ip-apim-introp-apibus-manage-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.240'
            ]
            destinationAddresses: [
              '10.203.1.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprhesbbw01-to-fqdn-apim-introp-apibus-manage-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.240'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.prdaz.compensar.int'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprhesbbw02-to-ip-apim-introp-apibus-manage-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.241'
            ]
            destinationAddresses: [
              '10.203.1.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprhesbbw02-to-fqdn-apim-introp-apibus-manage-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.241'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.prdaz.compensar.int'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-apibus-prd-i'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-centrl-manage-prd-i-to-op-gclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.16.0/22'
            ]
            destinationAddresses: [
              '192.168.4.8'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-centrl-prd-i'
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
            name: 'rule-asp-logsce-centrl-srvlog-prd-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.13.160/27'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rc-rg-transv-logsce-centrl-prd-i'
        priority: 130
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
  ]
}

resource afp_RCG_NET_PRP_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-PRP-I'
  properties: {
    priority: 3000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'dummy'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.0/24'
            ]
            destinationAddresses: [
              '10.1.0.0/24'
            ]
            destinationPorts: [
              '80'
            ]
          }
        ]
        name: 'rc-rg-bibatr-bibaf2-centrl-prp-i'
        priority: 160
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'dummy'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.0/24'
            ]
            destinationAddresses: [
              '10.1.0.0/24'
            ]
            destinationPorts: [
              '80'
            ]
          }
        ]
        name: 'rc-rg-bibatr-financ-dkcart-prp-i'
        priority: 170
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'dummy'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.0/24'
            ]
            destinationAddresses: [
              '10.1.0.0/24'
            ]
            destinationPorts: [
              '80'
            ]
          }
        ]
        name: 'rc-rg-csalud-medpre-transv-prp-i'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-transc-prp-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.205.12.32/27'
            ]
            destinationAddresses: [
              '192.168.208.12'
            ]
            destinationPorts: [
              '1443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-trvmdm-prp-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.205.13.96/28'
            ]
            destinationAddresses: [
              '192.168.208.12'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-gclint-syncro-stream-prp-i'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebxtdv-centrl-manage-prp-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.205.20.0/22'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-ebxtdv-centrl-loadfs-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.201/32'
            ]
            destinationAddresses: [
              '10.205.5.0/24'
            ]
            destinationPorts: [
              '139'
              '443'
              '445'
            ]
          }
        ]
        name: 'rc-rg-mdmtrv-ebxtdv-centrl-prp-i'
        priority: 140
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmpprhesbbw01-to-ip-apim-introp-apibus-manage-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.194'
            ]
            destinationAddresses: [
              '10.205.1.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmpprhesbbw01-to-fqdn-apim-introp-apibus-manage-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.194'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.prpaz.compensar.int'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmpprhesbbw02-to-ip-apim-introp-apibus-manage-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.195'
            ]
            destinationAddresses: [
              '10.205.1.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmpprhesbbw02-to-fqdn-apim-introp-apibus-manage-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.195'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.prpaz.compensar.int'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-apibus-prp-i'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-centrl-manage-prp-i-to-op-gclientespru'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.205.16.0/22'
            ]
            destinationAddresses: [
              '192.168.1.13'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-centrl-prp-i'
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
            name: 'rule-asp-logsce-centrl-srvlog-prp-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.205.13.160/27'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rc-rg-transv-logsce-centrl-prp-i'
        priority: 130
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
    afp_RCG_NET_PRD_I
  ]
}

resource afp_RCG_NET_TRV_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-TRV-I'
  properties: {
    priority: 1000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-agw-secuty-public-centrl-trv-i-to-spokes-snet-api'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-apim'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-agw-secuty-public-centrl-trv-i-to-spokes-snet-vault'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-vault'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-agw-secuty-public-centrl-trv-i-to-spokes-snet-st'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            destinationIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-st'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-agw-secuty-public-centrl-trv-i-to-spokes-lb-aks-medpre'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            destinationAddresses: [
              '10.89.27.250'
              '10.89.155.250'
              '10.203.27.250'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-az-vnets-hubtrv-to-spokes'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-pview-mgment-govern-datcat-trv-i-to-op-vmprumeta'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.64/26'
            ]
            destinationAddresses: [
              '192.168.19.111'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-pview-mgment-govern-datcat-trv-i-to-op-vmdripoll'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.64/26'
            ]
            destinationAddresses: [
              '192.168.20.61'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vsqlavgpru01'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.12'
            ]
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmdusumacinta'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.209.30'
            ]
            destinationPorts: [
              '8284'
              '8290'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmdmiles'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.19.205'
            ]
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmdliberia'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.108'
            ]
            destinationPorts: [
              '1433'
              '60745'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmdmocoa'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.209.24'
            ]
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmdvaupes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationPorts: [
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vpruxcaret'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.91'
            ]
            destinationPorts: [
              '8085'
              '8284'
              '8290'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vpruxplor'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.92'
            ]
            destinationPorts: [
              '57869'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmprujanabiyah'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.70'
            ]
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmprulisboa'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.109'
            ]
            destinationPorts: [
              '8290'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-trv-i-to-op-vmprudutu'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            destinationAddresses: [
              '192.168.208.57'
            ]
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rc-rg-datalh-mgment-govern-trv-i'
        priority: 110
      }
    ]
  }
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
    afp_RCG_NET_PRD_I
    afp_RCG_NET_PRP_I
  ]
}

resource afp_RCG_NET_TST_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-TST-I'
  properties: {
    priority: 4000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-bibaf2-centrl-ingest-tst-i-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.0/23'
            ]
            destinationAddresses: [
              '192.168.208.12'
              '192.168.208.57'
              '192.168.209.24'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-bibatr-bibaf2-centrl-tst-i'
        priority: 160
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'dummy'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.0.0.0/24'
            ]
            destinationAddresses: [
              '10.1.0.0/24'
            ]
            destinationPorts: [
              '80'
            ]
          }
        ]
        name: 'rc-rg-bibatr-financ-dkcart-tst-i'
        priority: 170
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-tst-i-to-ip-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.152.0/22'
            ]
            destinationAddresses: [
              '192.168.1.78/32'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-medpre-transv-manage-tst-i-to-fqdn-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.152.0/22'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'esbintprutls.compensar.com'
            ]
          }
        ]
        name: 'rc-rg-csalud-medpre-transv-tst-i'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-transc-tst-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.140.32/27'
            ]
            destinationAddresses: [
              '192.168.20.238'
              '192.168.20.230'
            ]
            destinationPorts: [
              '1443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-asp-syncro-stream-trvmdm-tst-i-to-op-bdcomclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.141.96/28'
            ]
            destinationAddresses: [
              '192.168.20.238'
              '192.168.20.230'
            ]
            destinationPorts: [
              '1443'
            ]
          }
        ]
        name: 'rc-rg-gclint-syncro-stream-tst-i'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebxtdv-centrl-manage-tst-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.148.0/22'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-ebxtdv-centrl-loadfs-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.201/32'
            ]
            destinationAddresses: [
              '10.89.133.0/24'
            ]
            destinationPorts: [
              '139'
              '443'
              '445'
            ]
          }
        ]
        name: 'rc-rg-mdmtrv-ebxtdv-centrl-tst-i'
        priority: 140
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprurhesb01-to-ip-apim-introp-apibus-manage-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.148'
            ]
            destinationAddresses: [
              '10.89.129.0/28'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vmprurhesb01-to-fqdn-apim-introp-apibus-manage-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.148'
            ]
            destinationPorts: [
              '443'
            ]
            destinationFqdns: [
              'api-transv-introp.tstaz.compensar.int'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-apibus-tst-i'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-centrl-manage-tst-i-to-op-gclientespru'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.144.0/22'
            ]
            destinationAddresses: [
              '192.168.1.13'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-rg-transv-introp-centrl-tst-i'
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
            name: 'rule-asp-logsce-centrl-srvlog-tst-i-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.141.160/27'
            ]
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rc-rg-transv-logsce-centrl-tst-i'
        priority: 130
      }
    ]
  }
  dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
    afp_RCG_NET_PRD_I
    afp_RCG_NET_PRP_I
    afp_RCG_NET_TRV_I
  ]
}

resource afp_RCG_NET_VPN_S2S 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'RCG-NET-VPN-S2S'
  properties: {
    priority: 10000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vpn-evtt-to-aks-medpre-transv-manage-dvl-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.216.0/21'
            ]
            destinationAddresses: [
              '10.89.24.0/22'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-dvl-i-vpn-to-compensar-salud'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vpn-evtt-to-aks-medpre-transv-manage-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.216.0/21'
            ]
            destinationAddresses: [
              '10.203.24.0/22'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-prd-i-vpn-to-compensar-salud'
        priority: 130
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vpn-evtt-to-aks-medpre-transv-manage-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.216.0/21'
            ]
            destinationAddresses: [
              '10.205.24.0/22'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-prp-i-vpn-to-compensar-salud'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vpn-evtt-to-aks-medpre-transv-manage-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.216.0/21'
            ]
            destinationAddresses: [
              '10.89.152.0/22'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rc-tst-i-vpn-to-compensar-salud'
        priority: 110
      }
    ]
  }

    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
    afp_RCG_NET_PRD_I
    afp_RCG_NET_PRP_I
    afp_RCG_NET_TRV_I
    afp_RCG_NET_TST_I
  ]}

