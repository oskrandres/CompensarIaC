
param location string
param ipgroup object 
//param tags object

resource ip_group 'Microsoft.Network/ipGroups@2020-08-01' = [for ipgroups in range(0,length(ipgroup.properties)):{
  properties: {
    ipAddresses: ipgroup.properties[ipgroups].iplist
  }
  name: ipgroup.properties[ipgroups].name
  location: location
  //tags: tags
}
]
