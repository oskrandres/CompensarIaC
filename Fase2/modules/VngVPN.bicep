param publicIPAddressName string
param location string
param name string
param virtualNetworkName string

resource publicIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddressName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
}

resource vng 'Microsoft.Network/virtualNetworkGateways@2020-11-01' = {
  name: name
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'gwipconfig1'
        properties: {
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', publicIPAddressName)
          }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, 'GatewaySubnet')
          }
          privateIPAllocationMethod: 'Dynamic' // Habilita Gateway Private IP
        }
      }
    ]
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: false
    sku: {
      name: 'VpnGw1' // Generación 2 requiere SKU con redundancia de zona
      tier: 'VpnGw1'
    }
  }
}
