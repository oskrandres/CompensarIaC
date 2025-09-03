
resource vnetMainTrvI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-trv-i'
}

resource vnetMainDvlI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-dvl-i'
}

resource vnetMainTstI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-tst-i'
}

resource vnetMainPrpI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-prp-i'
}

resource vnetMainPrdI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-prd-i'
}

resource vnetMainPocI 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  name: 'vnet-main-poc-i'
}

resource peerTrvToDvl 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-trv-i-to-vnet-main-dvl-i'
  parent: vnetMainTrvI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainDvlI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource peerDvlToTrv 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-dvl-i-to-vnet-main-trv-i'
  parent: vnetMainDvlI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTrvI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

resource peerTrvToTst 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-trv-i-to-vnet-main-tst-i'
  parent: vnetMainTrvI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTstI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource peerTstToTrv 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-tst-i-to-vnet-main-trv-i'
  parent: vnetMainTstI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTrvI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

resource peerTrvToPrp 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-trv-i-to-vnet-main-prp-i'
  parent: vnetMainTrvI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainPrpI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource peerPrpToTrv 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-prp-i-to-vnet-main-trv-i'
  parent: vnetMainPrpI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTrvI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

resource peerTrvToPrd 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-trv-i-to-vnet-main-prd-i'
  parent: vnetMainTrvI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainPrdI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource peerPrdToTrv 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-prd-i-to-vnet-main-trv-i'
  parent: vnetMainPrdI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTrvI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

resource peerTrvToPoc 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-trv-i-to-vnet-main-poc-i'
  parent: vnetMainTrvI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainPocI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource peerPocToTrv 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-05-01' = {
  name: 'peer-vnet-main-poc-i-to-vnet-main-trv-i'
  parent: vnetMainPocI
  properties: {
    remoteVirtualNetwork: {
      id: vnetMainTrvI.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}
