param publicIPAddressName string
param location string
param name string
param virtualNetworkName string

var tags = {
  responsable_operacional_nombre: 'Lois Albert Espinel Garcia'
  responsable_operacional_correo: 'laespinelg@compensar.com'
  responsable_operacional_telefono: '3008479901'
  responsable_costos_nombre: 'Diego Fernando Caviedes Quintero'
  responsable_costos_correo: 'dfcaviedesq@compensar.com'
  responsable_costos_telefono: '3183832718'
  responsable_seguridad_nombre: 'Yesid Alejandro Amaya Corredor'
  responsable_seguridad_correo: 'yaamayaco@compensar.com'
  responsable_seguridad_telefono: '3009749654'
  aplicacion_nombre: 'Networking & Security'
  aplicacion_descripcion: 'Networking'
  aplicacion_codigo_cmdb: 'SWPR000'
  aplicacion_capacidad: 'Transversal Cloud TI'
  costos_inductor: 'Servicios Transversales'
  costos_unidad_negocio: 'CSC'
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2020-11-01' = {
  name: publicIPAddressName
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
}

resource vng 'Microsoft.Network/virtualNetworkGateways@2020-11-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    ipConfigurations: [
      {
        name: 'gwipconfig1'
        properties: {
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', publicIPAddressName)
          }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, 'GatewaySubnet')
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: false
    sku: {
      name: 'VpnGw1'
      tier: 'VpnGw1'
    }
  }
}
