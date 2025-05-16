
param firewallPolicyName string = 'afwp-afw-secuty-public-centrl-trv-i'

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup()
}

resource rcg_app_internet 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'rcg_app_internet'
  properties: {
    priority: 30000
    ruleCollections: [

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_cat_computers+technology'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            targetFqdns: []
          }
        ]
        name: 'rc_az_vnets_to_internet_web_categories'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_cat_information_security'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            targetFqdns: []
          }
        ]
        name: 'rc_az_vnets_to_internet_web_categories'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_internet_fqdn_tag_microsoft'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: []
            targetFqdns: []
          }
        ]
        name: 'rc_az_vnets_to_internet_fqdn_tag'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.compensar.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.compensar.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.compensar.co'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.compensar.co']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.compensarsalud.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.compensarsalud.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.prucompensarsalud.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.prucompensarsalud.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.prdaws.compensar.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.pruaws.compensar.co']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.pruaws.compensar.co'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.prdaws.compensar.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.microsoft.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.microsoft.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.smtp_mail.outlook.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 587
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.outlook.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.smtp_office365.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 587
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.office365.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.google.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.google.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.googleapis.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.googleapis.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.gserviceaccount.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.gserviceaccount.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.kaspersky.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.kaspersky.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.debian.org'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            targetFqdns: ['*.debian.org']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.licensing.tableau.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            targetFqdns: ['*.licensing.tableau.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.stellarcyber.cloud'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            targetFqdns: ['*.stellarcyber.cloud']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.grupoemi.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Https'
                port: 6078
              }
            ]
            targetFqdns: ['*.grupoemi.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.e_collect.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Https'
                port: 445
              }
              {
                protocolType: 'Https'
                port: 22
              }
            ]
            targetFqdns: ['*.e-collect.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule_az_vnets_to_*.cloudamqp.com'
            sourceIpGroups: ['/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i', '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i']
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Https'
                port: 5671
              }
              {
                protocolType: 'Https'
                port: 5672
              }
            ]
            targetFqdns: ['*.cloudamqp.com']
          }
        ]
        name: 'rc_az_vnets_to_internet_url'
        priority: 30000
      }

    ]
  }
}
