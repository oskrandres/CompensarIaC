
//suscripcion Oscar 18bf3718-f695-4c96-8d45-72dc2e617d2e
//RG Oscar rg-platfr-secuty-privte-trv-i
//suscripcion Compensar 71bcfecb-881e-4957-8d57-800172d61ee6
//RG Compensar rg-platfr-netwrk-centrl-trv-i


param firewallPolicyName string = 'afwp-afw-netwrk-centrl-public-trv-i'

resource fp 'Microsoft.Network/firewallPolicies@2024-05-01' existing = {
  name: firewallPolicyName
}


resource rcg_RCG_NET_TEMP 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  name: 'RCG-NET-TEMP'
  parent: fp
  properties: {
    priority: 12000
    ruleCollections: [
      {
        name: 'rc-temp-windowed-exceptions'
        priority: 100
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: { type: 'Allow' }
        // Reglas temporales (agrega aquí según necesidad y elimina al vencer)
        rules: [ ]
      }
    ]
  }
}
