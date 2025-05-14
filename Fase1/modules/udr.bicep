param location string
param routeTableName string
param routes array

resource routeTable 'Microsoft.Network/routeTables@2021-02-01' = {
  name: routeTableName
  location: location
  properties: {
    disableBgpRoutePropagation: false
    routes: [for route in routes: {
      name: route.name
      properties: union({
        addressPrefix: route.properties.addressPrefix
        nextHopType: route.properties.nextHopType
      }, contains(route.properties, 'nextHopIpAddress') ? {
        nextHopIpAddress: route.properties.nextHopIpAddress
      } : {})
    }]
  }
}
