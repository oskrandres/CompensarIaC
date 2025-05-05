param virtualNetworks_vnet_netwrk_centrl_main_trv_i_name string = 'vnet-netwrk-centrl-main-trv-i'
param VnetSubnets array
param location string


resource virtualNetworks_vnet_netwrk_centrl_main_trv_i_name_resource 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: virtualNetworks_vnet_netwrk_centrl_main_trv_i_name
  location: location
  tags: {
    APLICACION: 'netwrk'
    CAPACIDAD: 'platfr'
    'COD-APP-CMDB': 'SWPR000'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.204.0.0/20'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        '10.204.3.4'
        '192.168.204.19'
        '168.63.129.16'
      ]
    }
    enableDdosProtection: false
  }
}

// Crear subnets usando el submódulo
module subnetsModule 'subnet.bicep' = [for subnet in VnetSubnets: {
  name: 'deploySubnet-${subnet.name}'
  params: {
    vnetName: virtualNetworks_vnet_netwrk_centrl_main_trv_i_name
    subnetName: subnet.name
    addressPrefix: subnet.addressPrefix
    serviceEndpoints: subnet.serviceEndpoints
    delegations: subnet.delegations
    privateEndpointNetworkPolicies: subnet.privateEndpointNetworkPolicies
    privateLinkServiceNetworkPolicies: subnet.privateLinkServiceNetworkPolicies
  }
}]
