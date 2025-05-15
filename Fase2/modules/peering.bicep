//param location string = resourceGroup().location
param vnetLocalName string
param vnetRemoteNames array
param peeringNames array

resource vnetLocal 'Microsoft.Network/virtualNetworks@2021-05-01' existing = {
  name: vnetLocalName
}

resource vnetRemotes 'Microsoft.Network/virtualNetworks@2021-05-01' existing = [for vnetName in vnetRemoteNames: {
  name: vnetName
}]

resource peeringsLocalToRemote 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = [for i in range(0, length(peeringNames)): {
  name: peeringNames[i].localToRemote
  parent: vnetLocal
  properties: {
    remoteVirtualNetwork: {
      id: vnetRemotes[i].id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
  }
}]

resource peeringsRemoteToLocal 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = [for i in range(0, length(peeringNames)): {
  name: peeringNames[i].remoteToLocal
  parent: vnetRemotes[i]
  properties: {
    remoteVirtualNetwork: {
      id: vnetLocal.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
  }
}]
