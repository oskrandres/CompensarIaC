/*
Deploy VPN Gateway
*/

param name string
param location string

param gatewayType string = 'Vpn'
param sku string
param vpnGatewayGeneration string

param vpnType string = 'RouteBased'
param pipName array
param vnetName string

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  name: '${vnetName}/GatewaySubnet'
}

resource pip 'Microsoft.Network/publicIPAddresses@2023-09-01' existing = {
  name: pipName[0]
}

resource vng 'Microsoft.Network/virtualNetworkGateways@2023-02-01' = {
  name: name
  location: location
  tags: {}
  properties: {
    gatewayType: gatewayType
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnet.id
          }
          publicIPAddress: {
            id: pip.id
          }
        }
      }
    ]
    vpnType: vpnType
    vpnGatewayGeneration: vpnGatewayGeneration
    sku: {
      name: sku
      tier: sku
    }
  }
}
