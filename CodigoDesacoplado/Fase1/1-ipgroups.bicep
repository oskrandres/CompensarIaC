param location string = resourceGroup().location

resource ipg_secuty_privte_azvnet_poc_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-poc-i'
  location: location
  properties: {
    ipAddresses: [
      '10.204.240.0/20'
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

resource ipg_secuty_privte_azvnet_dvl_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-dvl-i'
  location: location
  properties: {
    ipAddresses: [
      '10.89.0.0/20'
      '10.89.16.0/20'
      '10.89.32.0/20'
      '10.89.48.0/20'
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

resource ipg_secuty_privte_azvnet_tst_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-tst-i'
  location: location
  properties: {
    ipAddresses: [
      '10.89.128.0/20'
      '10.89.144.0/20'
      '10.89.160.0/20'
      '10.89.176.0/20'
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

resource ipg_secuty_privte_azvnet_prp_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-prp-i'
  location: location
  properties: {
    ipAddresses: [
      '10.205.0.0/20'
      '10.205.16.0/20'
      '10.205.32.0/20'
      '10.205.48.0/20'
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

resource ipg_secuty_privte_azvnet_prd_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-prd-i'
  location: location
  properties: {
    ipAddresses: [
      '10.203.0.0/20'
      '10.203.16.0/20'
      '10.203.32.0/20'
      '10.203.48.0/20'
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

resource ipg_secuty_privte_azvnet_trv_i 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azvnet-trv-i'
  location: location
  properties: {
    ipAddresses: [
      '10.204.0.0/20'
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

resource ipg_secuty_privte_azsnet_dmz 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-dmz'
  location: location
  properties: {
    ipAddresses: [
      '10.89.0.0/24'
      '10.89.128.0/24'
      '10.205.0.0/24'
      '10.203.0.0/24'
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

resource ipg_secuty_privte_azsnet_app 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-app'
  location: location
  properties: {
    ipAddresses: [
      '10.89.2.0/23'
      '10.89.130.0/23'
      '10.205.2.0/23'
      '10.203.2.0/23'
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

resource ipg_secuty_privte_azsnet_aks 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-aks'
  location: location
  properties: {
    ipAddresses: [
      '10.89.16.0/20'
      '10.89.144.0/20'
      '10.205.16.0/20'
      '10.203.16.0/20'
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

resource ipg_secuty_privte_azsnet_dbw 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-dbw'
  location: location
  properties: {
    ipAddresses: [
      '10.89.8.0/22'
      '10.89.32.0/22'
      '10.89.136.0/22'
      '10.89.160.0/22'
      '10.205.8.0/22'
      '10.205.32.0/22'
      '10.203.8.0/22'
      '10.203.32.0/22'
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

resource ipg_secuty_privte_azsnet_apim 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-apim'
  location: location
  properties: {
    ipAddresses: [
      '10.89.1.0/28'
      '10.89.129.0/28'
      '10.205.1.0/28'
      '10.203.1.0/28'
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

resource ipg_secuty_privte_azsnet_db 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-db'
  location: location
  properties: {
    ipAddresses: [
      '10.89.4.0/24'
      '10.89.132.0/24'
      '10.205.4.0/24'
      '10.203.4.0/24'
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

resource ipg_secuty_privte_azsnet_st 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-st'
  location: location
  properties: {
    ipAddresses: [
      '10.89.5.0/24'
      '10.89.133.0/24'
      '10.205.5.0/24'
      '10.203.5.0/24'
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

resource ipg_secuty_privte_azsnet_vault 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-vault'
  location: location
  properties: {
    ipAddresses: [
      '10.89.1.128/25'
      '10.89.129.128/25'
      '10.203.1.128/25'
      '10.205.1.128/25'
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

resource ipg_secuty_privte_azsnet_dmctrl 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-azsnet-dmctrl'
  location: location
  properties: {
    ipAddresses: [
      '10.204.3.4'
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

resource ipg_secuty_privte_opvlan_dmctrl 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-opvlan-dmctrl'
  location: location
  properties: {
    ipAddresses: [
      '192.168.10.123'
      '192.168.18.24'
      '192.168.18.44'
      '192.168.60.11'
      '192.168.68.31'
      '192.168.130.69'
      '192.168.186.12'
      '192.168.186.15'
      '192.168.204.11'
      '192.168.204.19'
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

resource ipg_secuty_privte_opvlan_vpnsec 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-opvlan-vpnsec'
  location: location
  properties: {
    ipAddresses: [
      '10.250.1.0/24'
      '10.254.0.0/21'
      '10.254.8.0/24'
      '10.82.0.0/19'
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

resource ipg_secuty_privte_opvlan_testng 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-opvlan-testng'
  location: location
  properties: {
    ipAddresses: [
      '192.168.188.22'
      '192.168.188.23'
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

resource ipg_secuty_privte_opvlan_scanng 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-opvlan-scanng'
  location: location
  properties: {
    ipAddresses: [
      '192.168.204.86'
      '192.168.204.17'
      '192.168.173.161'
      '192.168.173.168'
      '192.168.173.169'
      '192.168.173.162'
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

resource ipg_secuty_privte_opvlan_wificp 'Microsoft.Network/ipGroups@2023-02-01' = {
  name: 'ipg-secuty-privte-opvlan-wificp'
  location: location
  properties: {
    ipAddresses: [
      '192.168.240.0/21'
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
