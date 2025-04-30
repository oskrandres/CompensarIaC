/*
Main file to deploy a Virtual Network, Public IP, and ExpressRoute Virtual Network Gateway
*/

param name string
param location string
param vnetName string
param vnetAddressPrefix string
param gatewaySubnetPrefix string
param pipName string
param sku string

// Create Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: gatewaySubnetPrefix
        }
      }
    ]
  }
}

// Create Public IP Address
resource pip 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: pipName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// Deploy ExpressRoute Virtual Network Gateway
resource expressRouteVng 'Microsoft.Network/virtualNetworkGateways@2023-02-01' = {
  name: name
  location: location
  tags: {}
  properties: {
    gatewayType: 'ExpressRoute'
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: vnet.properties.subnets[0].id
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
