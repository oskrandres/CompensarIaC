
param firewallPolicyName string = 'test'

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup()
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
}
