@description('Ubicación del recurso')
param location string = resourceGroup().location

@description('Nombre del Virtual Network Gateway')
param vngName string

@description('Nombre de la IP pública')
param publicIpName string

@description('Nombre de la VNet')
param vnetName string

@description('SKU del Virtual Network Gateway')
param vngSkuName string

@description('Tier del Virtual Network Gateway')
param vngSkuTier string

@description('Tipo de Gateway')
param gatewayType string

@description('Tipo de VPN')
param vpnType string

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' existing = {
  name: vnetName
  scope: resourceGroup()
}

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: publicIpName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource vng 'Microsoft.Network/virtualNetworkGateways@2023-04-01' = {
  name: vngName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'vnetGatewayConfig'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIp.id
          }
          subnet: {
            id: '${vnet.id}/subnets/GatewaySubnet'
          }
        }
      }
    ]
    gatewayType: gatewayType
    vpnType: vpnType
    enableBgp: false
    activeActive: false
    sku: {
      name: vngSkuName
      tier: vngSkuTier
    }
  }
}
