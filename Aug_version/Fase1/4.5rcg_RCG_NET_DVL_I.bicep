
//suscripcion Oscar 18bf3718-f695-4c96-8d45-72dc2e617d2e
//RG Oscar rg-platfr-secuty-privte-trv-i
//suscripcion Compensar 71bcfecb-881e-4957-8d57-800172d61ee6
//RG Compensar rg-platfr-netwrk-centrl-trv-i


param firewallPolicyName string = 'afwp-afw-netwrk-centrl-public-trv-i'

resource fp 'Microsoft.Network/firewallPolicies@2024-05-01' existing = {
  name: firewallPolicyName
}

resource rcg_RCG_NET_DVL_I 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  name: 'RCG-NET-DVL-I'
  parent: fp
  properties: {
    priority: 5000
    ruleCollections: [
      // ----------------------------------------------------------
      // rc-rg-transv-introp-apibus-dvl-i (priority 100)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-transv-introp-apibus-dvl-i'
        priority: 100
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-op-vmdrhesb01-to-ip-apim-introp-apibus-manage-dvl-i'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '172.18.162.119' ]
            destinationAddresses: [ '10.89.1.0/28' ]
            destinationPorts: [ '443' ]
          }
          {
            name: 'rule-op-vmdrhesb01-to-fqdn-apim-introp-apibus-manage-dvl-i'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '172.18.162.119' ]
            destinationFqdns: [ 'api-transv-introp.dvlaz.compensar.int' ]
            destinationPorts: [ '443' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-transv-introp-centrl-dvl-i (priority 110)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-transv-introp-centrl-dvl-i'
        priority: 110
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-aks-introp-centrl-manage-dvl-i-to-op-gclientespru'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.16.0/22' ]
            destinationAddresses: [ '192.168.1.13' ]
            destinationPorts: [ '443' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-gclint-syncro-stream-dvl-i (priority 120)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-gclint-syncro-stream-dvl-i'
        priority: 120
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-asp-syncro-stream-transc-dvl-i-to-op-bdcomclientes'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.12.32/27' ]
            destinationAddresses: [ '192.168.20.238','192.168.20.230' ]
            destinationPorts: [ '1443' ]
          }
          {
            name: 'rule-asp-syncro-stream-trvmdm-dvl-i-to-op-bdcomclientes'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.13.96/28' ]
            destinationAddresses: [ '192.168.20.238','192.168.20.230' ]
            destinationPorts: [ '1443' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-transv-logsce-centrl-dvl-i (priority 130)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-transv-logsce-centrl-dvl-i'
        priority: 130
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-asp-logsce-centrl-srvlog-dvl-i-to-smtp-outook.com'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.13.160/27' ]
            destinationAddresses: [ '40.96.0.0/13','40.104.0.0/15','52.96.0.0/14' ]
            destinationPorts: [ '587' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-mdmtrv-ebxtdv-centrl-dvl-i (priority 140)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-mdmtrv-ebxtdv-centrl-dvl-i'
        priority: 140
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-aks-ebxtdv-centrl-manage-dvl-i-to-smtp-outook.com'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.20.0/22' ]
            destinationAddresses: [ '40.96.0.0/13','40.104.0.0/15','52.96.0.0/14' ]
            destinationPorts: [ '587' ]
          }
          {
            name: 'rule-op-etlbd-to-st-ebxtdv-centrl-loadfs-dvl-i'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '192.168.208.201/32' ]
            destinationAddresses: [ '10.89.5.0/24' ]
            destinationPorts: [ '139','443','445' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-csalud-medpre-transv-dvl-i (priority 150)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-csalud-medpre-transv-dvl-i'
        priority: 150
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-ip-op-bus-tibco'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.24.0/22' ]
            destinationAddresses: [ '192.168.1.78/32' ]
            destinationPorts: [ '443' ]
          }
          {
            name: 'rule-aks-medpre-transv-manage-dvl-i-to-fqdn-op-bus-tibco'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.24.0/22' ]
            destinationFqdns: [ 'esbintprutls.compensar.com' ]
            destinationPorts: [ '443' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-bibatr-bibaf2-centrl-dvl-i (priority 160)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-bibatr-bibaf2-centrl-dvl-i'
        priority: 160
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-vm-bibaf2-centrl-ingest-dvl-i-to-op-bdsqlclientes'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.2.0/23' ]
            destinationAddresses: [ '192.168.208.12','192.168.208.57','192.168.209.24' ]
            destinationPorts: [ '1433' ]
          }
        ]
      }
      // ----------------------------------------------------------
      // rc-rg-bibatr-financ-dkcart-dvl-i (priority 170)
      // ----------------------------------------------------------
      {
        name: 'rc-rg-bibatr-financ-dkcart-dvl-i'
        priority: 170
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-dbw-financ-dkcart-transc-pub-dvl-i-to-op-vmdvaupes'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.9.128/26' ]
            destinationAddresses: [ '192.168.19.37' ]
            destinationPorts: [ '445' ]
          }
          {
            name: 'rule-dbw-financ-dkcart-transc-prv-dvl-i-to-op-vmdvaupes'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.89.9.192/26' ]
            destinationAddresses: [ '192.168.19.37' ]
            destinationPorts: [ '445' ]
          }
        ]
      }
    ]
  }
}
