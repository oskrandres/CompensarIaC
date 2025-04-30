/*
Deploy Local Network Gateway
*/

param lngName string
param location string

resource lng 'Microsoft.Network/localNetworkGateways@2024-01-01' = {
  name: lngName
  location: location
  properties: {
    localNetworkAddressSpace: {
      addressPrefixes: [
        '10.82.0.0/19'
        '10.250.0.0/23'
        '10.254.0.0/20'
        '192.168.0.0/16'
      ]
    }
    gatewayIpAddress: '190.143.65.198'
  }
}
