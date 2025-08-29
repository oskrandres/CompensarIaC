param location string = resourceGroup().location

resource lgw_con_netwrk_vpnsts_compensar_ccf_onpremise_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-compensar-ccf-onpremise-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '190.143.65.198'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '10.82.0.0/19'
        '10.250.0.0/23'
        '10.254.0.0/20'
        '172.18.162.0/24'
        '192.168.0.0/16'
      ]
    }
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

resource lgw_con_netwrk_vpnsts_compensar_ccf_aws_preprod_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-compensar-ccf-aws-preprod-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '3.218.54.89'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '10.24.0.0/16'
      ]
    }
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

resource lgw_con_netwrk_vpnsts_compensar_salud_azure_prod_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-compensar-salud-azure-prod-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '52.138.120.126'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '172.27.150.0/23'
        '172.27.251.0/24'
      ]
    }
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

resource lgw_con_netwrk_vpnsts_compensar_salud_azure_noprod_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-compensar-salud-azure-noprod-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '20.10.22.171'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '172.27.216.0/21'
        '172.27.224.0/23'
        '172.27.232.0/23'
        '172.27.234.0/24'
      ]
    }
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

resource lgw_con_netwrk_vpnsts_ciel_azure_digiturno_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-ciel-azure-digiturno-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '40.77.5.149'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '10.204.224.0/26'
      ]
    }
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

resource lgw_con_netwrk_vpnsts_digitalware_onpremise_andromeda_trv_i 'Microsoft.Network/localNetworkGateways@2022-09-01' = {
  name: 'lgw-con-netwrk-vpnsts-digitalware-onpremise-andromeda-trv-i'
  location: location
  properties: {
    gatewayIpAddress: '186.190.254.151'
    localNetworkAddressSpace: {
      addressPrefixes: [
        '10.204.224.64/26'
        '10.238.90.198/32'
        '10.238.94.6/32'
      ]
    }
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
