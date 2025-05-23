
param firewallPolicyName string = 'afwp-afw-secuty-public-centrl-trv-i'

resource afp 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup()
}

resource rcg_app_internet 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: afp
  name: 'rcg_app_internet1'
  properties: {
    priority: 30001
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
                protocolType: 'Http'
                port: 80
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: []
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-dvl-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-tst-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prp-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-prd-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-trv-i'
              '/subscriptions/18bf3718-f695-4c96-8d45-72dc2e617d2e/resourceGroups/rg-platfr-secuty-public-trv-i/providers/Microsoft.Network/ipGroups/ipg-secuty-privte-azvnet-poc-i'
            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rc-az-vnets-to-internet-web-categories'
        priority: 110
      }
    ]
  }
}
