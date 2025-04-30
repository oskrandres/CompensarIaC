param location string
param circuitName string
param serviceProviderName string
param peeringLocation string
param bandwidthInMbps int
param skuTier string
param skuFamily string

resource expressRouteCircuit 'Microsoft.Network/expressRouteCircuits@2023-02-01' = {
  name: circuitName
  location: location
  sku: {
    name: '${skuTier}_${skuFamily}'
    tier: skuTier
    family: skuFamily
  }
  properties: {
    serviceProviderProperties: {
      serviceProviderName: serviceProviderName
      peeringLocation: peeringLocation
      bandwidthInMbps: bandwidthInMbps
    }
    allowClassicOperations: false
  }
}
