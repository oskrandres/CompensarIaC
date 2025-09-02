resource publicIP 'Microsoft.Network/publicIPAddresses@2024-05-01' existing = {
  name: 'pip-vgw-netwrk-centrl-exprte-trv-i'
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: 'vnet-netwrk-centrl-main-trv-i'
}

resource virtualNetworkGateway 'Microsoft.Network/virtualNetworkGateways@2024-05-01' = {
  name: 'vgw-netwrk-centrl-exprte-trv-i'
  location: resourceGroup().location
  properties: {
    enablePrivateIpAddress: false
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIP.id
          }
          subnet: {
            id: '${vnet.id}/subnets/GatewaySubnet'
          }
        }
      }
    ]
    sku: {
      name: 'ErGw2AZ'
      tier: 'ErGw2AZ'
    }
    gatewayType: 'ExpressRoute'
    vpnType: 'PolicyBased'
    enableBgp: false
    activeActive: false
    vpnGatewayGeneration: 'None'
    allowRemoteVnetTraffic: true
    allowVirtualWanTraffic: true
  }
  tags: {
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
}
