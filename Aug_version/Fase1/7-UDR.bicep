param location string = resourceGroup().location

resource routeTable 'Microsoft.Network/routeTables@2023-02-01' = {
  name: 'rt-snet-GatewaySubnet-trv-i'
  location: location
  properties: {
    disableBgpRoutePropagation: false
    routes: [
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-01'
        properties: {
          addressPrefix: '10.89.0.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-02'
        properties: {
          addressPrefix: '10.89.16.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-03'
        properties: {
          addressPrefix: '10.89.32.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-dvl-i-04'
        properties: {
          addressPrefix: '10.89.48.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-tst-i-01'
        properties: {
          addressPrefix: '10.89.128.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-tst-i-02'
        properties: {
          addressPrefix: '10.89.144.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-tst-i-03'
        properties: {
          addressPrefix: '10.89.160.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-tst-i-04'
        properties: {
          addressPrefix: '10.89.176.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prp-i-01'
        properties: {
          addressPrefix: '10.205.0.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prp-i-02'
        properties: {
          addressPrefix: '10.205.16.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prp-i-03'
        properties: {
          addressPrefix: '10.205.32.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prp-i-04'
        properties: {
          addressPrefix: '10.205.48.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prd-i-01'
        properties: {
          addressPrefix: '10.203.0.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prd-i-02'
        properties: {
          addressPrefix: '10.203.16.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prd-i-03'
        properties: {
          addressPrefix: '10.203.32.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-prd-i-04'
        properties: {
          addressPrefix: '10.203.48.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-trv-i-01'
        properties: {
          addressPrefix: '10.204.0.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vnet-netwrk-centrl-main-poc-i-01'
        properties: {
          addressPrefix: '10.204.240.0/20'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.204.1.132'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-ccf-aws-dev'
        properties: {
          addressPrefix: '10.19.0.0/16'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-ccf-aws-test'
        properties: {
          addressPrefix: '10.20.0.0/16'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-ccf-aws-preprod'
        properties: {
          addressPrefix: '10.24.0.0/16'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-ccf-aws-prod'
        properties: {
          addressPrefix: '10.21.0.0/16'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-ccf-aws-hub'
        properties: {
          addressPrefix: '10.83.0.0/16'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-noprod-01'
        properties: {
          addressPrefix: '172.27.216.0/21'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-noprod-02'
        properties: {
          addressPrefix: '172.27.224.0/23'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-noprod-03'
        properties: {
          addressPrefix: '172.27.232.0/23'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-noprod-04'
        properties: {
          addressPrefix: '172.27.234.0/24'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-prod-01'
        properties: {
          addressPrefix: '172.27.150.0/23'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-compensar-salud-azure-prod-02'
        properties: {
          addressPrefix: '172.27.251.0/24'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
      {
        name: 'rt-vpn-sts-ciel-azure-digiturno'
        properties: {
          addressPrefix: '10.204.224.0/26'
          nextHopType: 'VirtualNetworkGateway'
        }
      }
    ]
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
