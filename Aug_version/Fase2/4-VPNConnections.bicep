param location string = resourceGroup().location

var commonTags = {
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
}

resource vpnConnection1 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-compensar-ccf-onpremise-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
       properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-compensar-ccf-onpremise-trv-i')
       properties: {}
    }
    sharedKey: 'IEKmqQ2yjioGHmD'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 3600
        saDataSizeKilobytes: 1024
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA1'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA1'
        dhGroup: 'DHGroup2'
        pfsGroup: 'PFS2'
      }
    ]
  }
}

resource vpnConnection2 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-compensar-ccf-aws-preprod-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
       properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-compensar-ccf-aws-preprod-trv-i')
       properties: {}
    }
    sharedKey: 'ZDVFvlJTI0ybvEWRvHDnsCtedHa7FyZD*'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 3600
        saDataSizeKilobytes: 0
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA256'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA256'
        dhGroup: 'DHGroup14'
        pfsGroup: 'None'
      }
    ]
  }
}

resource vpnConnection3 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-compensar-salud-azure-prod-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
       properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-compensar-salud-azure-prod-trv-i')
       properties: {}
    }
    sharedKey: 'C0mp3ns4RSH4r4d**KEYProd'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 3600
        saDataSizeKilobytes: 0
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA1'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA1'
        dhGroup: 'DHGroup2'
        pfsGroup: 'PFS2'
      }
    ]
  }
}

resource vpnConnection4 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-compensar-salud-azure-noprod-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
       properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-compensar-salud-azure-noprod-trv-i')
       properties: {}
    }
    sharedKey: 'C0mp3ns4RSH4r8d**KEYNoProd'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 3600
        saDataSizeKilobytes: 0
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA1'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA1'
        dhGroup: 'DHGroup2'
        pfsGroup: 'PFS2'
      }
    ]
  }
}

resource vpnConnection5 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-ciel-azure-digiturno-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
       properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-ciel-azure-digiturno-trv-i')
       properties: {}
    }
    sharedKey: 'GxV9TMSpltMRh8&@ot#pqJMRdp3OZsAN'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 28800
        saDataSizeKilobytes: 0
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA256'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA256'
        dhGroup: 'DHGroup24'
        pfsGroup: 'PFS24'
      }
    ]
  }
}


resource vpnConnection6 'Microsoft.Network/connections@2020-11-01' = {
  name: 'con-netwrk-vpnsts-digitalware-onpremise-andromeda-trv-i'
  location: location
  tags: commonTags
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-netwrk-centrl-vpnsec-trv-i')
      properties: {}
    }
    localNetworkGateway2: {
      id: resourceId('Microsoft.Network/localNetworkGateways', 'lgw-con-netwrk-vpnsts-digitalware-onpremise-andromeda-trv-i')
      properties: {}
    }
    sharedKey: '6&amp;tTj%*AMK*.35Der'
    usePolicyBasedTrafficSelectors: false
    ipsecPolicies: [
      {
        saLifeTimeSeconds: 28800
        saDataSizeKilobytes: 0
        ipsecEncryption: 'AES256'
        ipsecIntegrity: 'SHA256'
        ikeEncryption: 'AES256'
        ikeIntegrity: 'SHA256'
        dhGroup: 'DHGroup14'
        pfsGroup: 'None'
      }
    ]
  }
}
