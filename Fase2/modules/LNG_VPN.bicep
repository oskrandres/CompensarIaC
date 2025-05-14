
param location string
param localNetworkGateways array

resource localNetworkGatewaysResource 'Microsoft.Network/localNetworkGateways@2023-02-01' = [for lng in localNetworkGateways: {
 name: lng.name
 location: location
 properties: {
 gatewayIpAddress: lng.gatewayIpAddress
 localNetworkAddressSpace: {
 addressPrefixes: lng.addressPrefixes
 }
 }
}]
