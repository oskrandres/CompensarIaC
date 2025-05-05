param vnetName string
param subnetName string
param addressPrefix string
param serviceEndpoints array = []
param delegations array = []
param privateEndpointNetworkPolicies string = 'Enabled'
param privateLinkServiceNetworkPolicies string = 'Enabled'

resource virtualNetworks_vnet_netwrk_centrl_main_trv_i_name_resource 'Microsoft.Network/virtualNetworks@2023-11-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-11-01' = {
  name: subnetName
  parent: virtualNetworks_vnet_netwrk_centrl_main_trv_i_name_resource
  properties: {
    addressPrefix: addressPrefix
    serviceEndpoints: serviceEndpoints
    delegations: [for delegation in delegations: {
      name: delegation.name
      properties: {
        serviceName: delegation.serviceName
      }
      type: delegation.type
    }]
    privateEndpointNetworkPolicies: privateEndpointNetworkPolicies
    privateLinkServiceNetworkPolicies: privateLinkServiceNetworkPolicies
  }
}
