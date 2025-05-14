param subscriptionId string
param resourceGroupName string
param location string
param tags object

// Módulo para desplegar el Azure Firewall
module azureFirewall 'modules/AzureFirewall.bicep' = {
  name: 'deployAzureFirewall'
  params: {
    subscriptionId: subscriptionId
    resourceGroupName: resourceGroupName
    location: location
    afwName: 'afw-secuty-public-centrl-trv-i'
    vnetName: 'vnet-netwrk-centrl-main-trv-i'
    subnetName: 'AzureFirewallSubnet'
    pipName: 'pip-afw-secuty-public-centrl-trv-i'
    tags: tags
  }
}

// Módulo para desplegar Log Analytics
module logAnalytics 'modules/LogAnalytics.bicep' = {
  name: 'deployLogAnalytics'
  params: {
    location: location
    logAnalyticsWorkspaceName: 'log-secuty-public-centrl-trv-i'
  }
}

// Módulo para desplegar User Defined Routes (UDR)
module udr 'modules/udr.bicep' = {
  name: 'deployUDR'
  params: {
    location: location
    routeTableName: 'rt-snet-GatewaySubnet-trv-i'
    routes: [
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-01'
        addressPrefix: '10.89.0.0/20'
        nextHopType: 'VirtualAppliance'
        nextHopIpAddress: '10.204.1.132'
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-02'
        addressPrefix: '10.89.16.0/20'
        nextHopType: 'VirtualAppliance'
        nextHopIpAddress: '10.204.1.132'
      }
    ]
  }
}
