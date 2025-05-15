
param firewallPolicyName string = 'test'

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup()
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
  /*
    dependsOn: [
    afp_RCG_NET_AUDIT_SCAN
    afp_RCG_NET_COMMON
    afp_RCG_NET_DVL_I
    afp_RCG_NET_INTERNET
    afp_RCG_NET_MGMT
  ]
    */
}
