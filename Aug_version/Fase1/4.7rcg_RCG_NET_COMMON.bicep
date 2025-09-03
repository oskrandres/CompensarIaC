
//suscripcion Oscar 18bf3718-f695-4c96-8d45-72dc2e617d2e
//RG Oscar rg-platfr-secuty-privte-trv-i
//suscripcion Compensar 71bcfecb-881e-4957-8d57-800172d61ee6
//RG Compensar rg-platfr-netwrk-centrl-trv-i

param ipGroups_ipgroup_azsnet_db_externalid string    = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-db'
param ipGroups_ipgroup_azsnet_dmctrl_externalid string= '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azsnet-dmctrl'
param ipGroups_ipgroup_azvnet_dvl_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
param ipGroups_ipgroup_azvnet_poc_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
param ipGroups_ipgroup_azvnet_prd_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
param ipGroups_ipgroup_azvnet_prp_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
param ipGroups_ipgroup_azvnet_trv_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
param ipGroups_ipgroup_azvnet_tst_i_externalid string = '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
param ipGroups_ipgroup_opvlan_dmctrl_externalid string= '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-opvlan-dmctrl'

param firewallPolicyName string = 'afwp-afw-netwrk-centrl-public-trv-i'

resource fp 'Microsoft.Network/firewallPolicies@2024-05-01' existing = {
  name: firewallPolicyName
}

resource rcg_RCG_NET_COMMON 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  name: 'RCG-NET-COMMON'
  parent: fp
  properties: {
    priority: 7000
    ruleCollections: [
      // ----------------------------------------------------------
      // Domain Controllers (bidireccional) – priority 100
      // ----------------------------------------------------------
      {
        name: 'rc-az-vnets-to-domain-controllers'
        priority: 100
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-az-vnets-to-az-domain-controllers'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationIpGroups: [ ipGroups_ipgroup_opvlan_dmctrl_externalid ]
            destinationPorts: [ '42','53','88','123','135','137','138','139','389','445','464','500','636','3268','3269','3389','4500','1024-5000','49152-65535' ]
          }
          {
            name: 'rule-az-vnets-to-az-domain-controllers-reverse'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [ ipGroups_ipgroup_opvlan_dmctrl_externalid ]
            destinationIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationPorts: [ '42','53','88','123','135','137','138','139','389','445','464','500','636','3268','3269','3389','4500','1024-5000','49152-65535' ]
          }
          {
            name: 'rule-az-vnets-to-op-domain-controllers'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationIpGroups: [ ipGroups_ipgroup_azsnet_dmctrl_externalid ]
            destinationPorts: [ '42','53','88','123','135','137','138','139','389','445','464','500','636','3268','3269','3389','4500','1024-5000','49152-65535' ]
          }
          {
            name: 'rule-az-vnets-to-op-domain-controllers-reverse'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [ ipGroups_ipgroup_azsnet_dmctrl_externalid ]
            destinationIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationPorts: [ '42','53','88','123','135','137','138','139','389','445','464','500','636','3268','3269','3389','4500','1024-5000','49152-65535' ]
          }
        ]
      }

      // ----------------------------------------------------------
      // DNS Resolution – priority 110
      // ----------------------------------------------------------
      {
        name: 'rc-az-vnets-to-dns-resolution'
        priority: 110
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-az-vnets-to-az-dns'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationIpGroups: [ ipGroups_ipgroup_azsnet_dmctrl_externalid ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-az-vnets-to-op-dns'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationIpGroups: [ ipGroups_ipgroup_opvlan_dmctrl_externalid ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-az-vnets-to-internet-dns'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationAddresses: [ '168.63.129.16', '1.1.1.1', '8.8.8.8' ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-az-vnets-to-az-dnspr-netwrk-centrl-dnsppl-trv-i'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [ ipGroups_ipgroup_azvnet_trv_i_externalid ]
            destinationIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
            ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-az-vnets-to-az-dnspr-netwrk-centrl-dnsppl-trv-i-reverse'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
            ]
            destinationIpGroups: [ ipGroups_ipgroup_azvnet_trv_i_externalid ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-dnspr-netwrk-centrl-dnsppl-trv-i-to-op-domain-controllers'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceAddresses: [ '10.204.2.0/25' ]
            destinationIpGroups: [ ipGroups_ipgroup_opvlan_dmctrl_externalid ]
            destinationPorts: [ '53' ]
          }
          {
            name: 'rule-dnspr-netwrk-centrl-dnsppl-trv-i-to-op-domain-controllers-reverse'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [ ipGroups_ipgroup_opvlan_dmctrl_externalid ]
            destinationAddresses: [ '10.204.2.0/25' ]
            destinationPorts: [ '53' ]
          }
        ]
      }

      // ----------------------------------------------------------
      // KAV Antivirus – priority 120
      // ----------------------------------------------------------
      {
        name: 'rc-az-vnets-to-kav-antivirus'
        priority: 120
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-az-vnets-to-op-kav-antivirus'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP','UDP' ]
            sourceIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationAddresses: [ '192.168.204.71','192.168.204.99' ]
            destinationPorts: [ '80','135','137','139','443','445','902','9071','9101','9103','11111','13000','13291','13292','14000','15000','18000','20030','20200','25004','25007-25011','31001','41000','6109','1024-65535' ]
          }
        ]
      }

      // ----------------------------------------------------------
      // DevOps Agent – priority 130
      // ----------------------------------------------------------
      {
        name: 'rc-az-vnets-to-devops-agent'
        priority: 130
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        rules: [
          {
            name: 'rule-az-devops-to-az-vnets'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.204.3.5','10.204.3.6' ]
            destinationIpGroups: [
              ipGroups_ipgroup_azvnet_dvl_i_externalid
              ipGroups_ipgroup_azvnet_tst_i_externalid
              ipGroups_ipgroup_azvnet_prp_i_externalid
              ipGroups_ipgroup_azvnet_prd_i_externalid
              ipGroups_ipgroup_azvnet_poc_i_externalid
              ipGroups_ipgroup_azvnet_trv_i_externalid
            ]
            destinationPorts: [ '22','53','80','135','443','1000','1433','2179','2382','2383','3389','6380','6901','6910','8080','8081','8100','9050','9191','10000-20000','17012','49152-65535' ]
          }
          {
            name: 'rule-az-devops-to-spokes-snet-db'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.204.3.5','10.204.3.6' ]
            destinationIpGroups: [ ipGroups_ipgroup_azsnet_db_externalid ]
            destinationPorts: [ '20000-30000','40000-43000' ]
          }
          {
            name: 'rule-op-devops-to-spokes-snet-db'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '192.168.204.225','192.168.204.227' ]
            destinationIpGroups: [ ipGroups_ipgroup_azsnet_db_externalid ]
            destinationPorts: [ '1433' ]
          }
          {
            name: 'rule-az-devops-to-spokes-snet-psql-medpre'
            ruleType: 'NetworkRule'
            ipProtocols: [ 'TCP' ]
            sourceAddresses: [ '10.204.3.5','10.204.3.6' ]
            destinationAddresses: [ '10.89.6.0/28','10.89.134.0/28','10.205.6.0/28','10.203.6.0/28' ]
            destinationPorts: [ '5432' ]
          }
        ]
      }
    ]
  }
}
