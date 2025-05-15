param name string
param location string
param publicIPAddressName string
param sku string
param virtualNetworkName string
//param tags object

// Recurso IP pública
resource pip 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: publicIPAddressName
  location: location
  //tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// ExpressRoute Virtual Network Gateway reutilizando VNet existente
resource expressRouteVng 'Microsoft.Network/virtualNetworkGateways@2023-02-01' = {
  name: name
  location: location
  //tags: tags
  properties: {
    gatewayType: 'ExpressRoute'
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, 'GatewaySubnet')
          }
          publicIPAddress: {
            id: pip.id
          }
        }
      }
    ]
    sku: {
      name: sku
      tier: sku
    }
  }
}
