// Parámetros globales
param tags object

// Parámetros de log analytics
param logAnalyticsWorkspaceName string
param logAnalyticsSKU string

// Parámetros de la route table
param routeTableName string
param routes array

// Parametros de Azure Firewall
param publicFirewallIPName string
param firewallPolicyName string
param zones array
param firewallVnet string
param firewallSubnet string

// Desplegar Log Analytics
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsWorkspaceName  
  location: resourceGroup().location
  properties: {
    sku: {
      name: logAnalyticsSKU
    }
    retentionInDays: 30
  }
  tags: tags
}

// Desplegar route table
resource routeTable 'Microsoft.Network/routeTables@2021-02-01' = {
  name: routeTableName
  location: resourceGroup().location
  tags: tags
  properties: {
    disableBgpRoutePropagation: false
    routes: [for route in routes: {
      name: route.name
      properties: union({
        addressPrefix: route.properties.addressPrefix
        nextHopType: route.properties.nextHopType
      }, contains(route.properties, 'nextHopIpAddress') ? {
        nextHopIpAddress: route.properties.nextHopIpAddress
      } : {})
    }]
  }
}

// Desplegar Firewall y sus recursos asociados.
module afw 'modules/AzureFirewall.bicep' = {
  name: 'AzureFirewallDeploy'
  scope: resourceGroup()
  params: {
    location: resourceGroup().location
    publicFirewallIPName: publicFirewallIPName
    firewallPolicyName: firewallPolicyName
    firewallVnet: firewallVnet
    firewallSubnet: firewallSubnet
    zones: zones
    tags: tags
  }
}
