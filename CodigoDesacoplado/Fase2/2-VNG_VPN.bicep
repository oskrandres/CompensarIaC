param location string = resourceGroup().location
param publicIPAddresses_ip_GWSubnet_transversal_VPN_externalid string
param virtualNetworks_vnetMain_transversal_externalid string

resource virtualNetworkGateway 'Microsoft.Network/virtualNetworkGateways@2024-05-01' = {
  name: 'vgw-secuty-public-vpnsec-trv-i'
  location: location
  properties: {
    enablePrivateIpAddress: false
    ipConfigurations: [
      {
        name: 'ip-vgw-secuty-public-vpnsec-trv-i'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_ip_GWSubnet_transversal_VPN_externalid
          }
          subnet: {
            id: '\${virtualNetworks_vnetMain_transversal_externalid}/subnets/GatewaySubnet'
          }
        }
      }
    ]
    sku: {
      name: 'VpnGw1AZ'
      tier: 'VpnGw1AZ'
    }
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: false
    vpnGatewayGeneration: 'Generation1'
    allowRemoteVnetTraffic: false
    allowVirtualWanTraffic: false
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
