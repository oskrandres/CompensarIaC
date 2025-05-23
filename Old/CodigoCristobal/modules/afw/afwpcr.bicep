/*
Azure Firewall Policy Collection Rule Deployment
*/

param afwpName string
param cr object

resource afwp 'Microsoft.Network/firewallPolicies@2024-03-01' existing = {
  name:afwpName
}

resource afwpcr 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-03-01' =[for crs in range(0,length(cr.properties)): {
  name: cr.properties[crs].name
  parent:afwp
  properties:{
    priority: cr.properties[crs].priority
  }
}
]
