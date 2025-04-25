/*
Deploy public IPs
*/

param pipName array
param location string

resource publicIPAddresses_myStandardPublicIP_name_resource 'Microsoft.Network/publicIPAddresses@2024-01-01' = [for pip in range(0,length(pipName)):{
  name: pipName[pip]
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
    '2'
    '3'
  ]
  
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}
]
