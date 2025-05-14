/*
VPN Connection
*/

param vpnConnectionName string
param location string
param vngName string
param lngName string
param tags object

resource vpn 'Microsoft.Network/virtualNetworkGateways@2024-01-01' existing = {
  name:vngName
}

resource lng 'Microsoft.Network/localNetworkGateways@2024-01-01' existing = {
  name:lngName
}

resource connections_conn_compensar_name_resource 'Microsoft.Network/connections@2024-01-01' = {
  name: vpnConnectionName
  location: location
  tags: tags
  properties: {
    virtualNetworkGateway1: {
      id: vpn.id
      properties: {}
    }
    localNetworkGateway2: {
      id: lng.id
      properties: {}
    }
    connectionType: 'IPsec'
    connectionProtocol: 'IKEv2'
    routingWeight: 0
    enableBgp: false
    useLocalAzureIpAddress: false
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 3600
        saDataSizeKilobytes: 1024
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA1'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA1'
        dhGroup: 'DHGroup2'
        pfsGroup: 'PFS2'
      }
    ]
    trafficSelectorPolicies: []
    expressRouteGatewayBypass: false
    enablePrivateLinkFastPath: false
    dpdTimeoutSeconds: 45
    connectionMode: 'Default'
    gatewayCustomBgpIpAddresses: []
  }
}
