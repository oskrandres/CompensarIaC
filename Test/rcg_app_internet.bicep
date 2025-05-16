
param firewallPolicyName string

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
            name: 'rule-az-vnets-to-cat-computers+technology'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-web-categories'
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
            name: 'rule-az-vnets-to-cat-information-security'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-web-categories'
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
            name: 'rule-az-vnets-to-internet-fqdn-tag-microsoft'
            protocols: [

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-fqdn-tag'
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
            name: 'rule-az-vnets-to-*.compensar.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensar.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.compensar.co'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensar.co'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.compensarsalud.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensarsalud.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.prucompensarsalud.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.prucompensarsalud.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.prdaws.compensar.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.pruaws.compensar.co'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.pruaws.compensar.co'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.prdaws.compensar.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.microsoft.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.microsoft.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.smtp-mail.outlook.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.outlook.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.smtp-office365.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.office365.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.google.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.google.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.googleapis.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.googleapis.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.gserviceaccount.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.gserviceaccount.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.kaspersky.com'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.kaspersky.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.debian.org'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.debian.org'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.licensing.tableau.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.licensing.tableau.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.stellarcyber.cloud'
            protocols: [

              {
                protocolType: 'Https'
                port: 443
              }

            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.stellarcyber.cloud'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.grupoemi.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.grupoemi.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.e-collect.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.e-collect.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
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
            name: 'rule-az-vnets-to-*.cloudamqp.com'
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
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.cloudamqp.com'

            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/71bcfecb-881e-4957-8d57-800172d61ee6/resourceGroups/rg-platfr-secuty-privte-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'

            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-url'
        priority: 30000
      }

    ]
  }
}
