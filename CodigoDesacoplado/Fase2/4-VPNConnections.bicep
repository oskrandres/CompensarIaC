// Se debe validar los parámetros de negociación de cada VPN con el área de telecomunicaciones

param location string = resourceGroup().location

resource vpnConnection1 'Microsoft.Network/connections@2020-11-01' = {
  name: 'lgw-con-netwrk-vpnsts-compensar-ccf-onpremise-trv-i'
  location: location
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-secuty-public-vpnsec-trv-i')
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
  name: 'lgw-con-netwrk-vpnsts-compensar-ccf-aws-preprod-trv-i'
  location: location
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-secuty-public-vpnsec-trv-i')
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
  name: 'lgw-con-netwrk-vpnsts-compensar-salud-azure-prod-trv-i'
  location: location
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-secuty-public-vpnsec-trv-i')
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
  name: 'lgw-con-netwrk-vpnsts-compensar-salud-azure-noprod-trv-i'
  location: location
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-secuty-public-vpnsec-trv-i')
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
  name: 'lgw-con-netwrk-vpnsts-ciel-azure-digiturno-trv-i'
  location: location
  properties: {
    connectionType: 'IPsec'
    virtualNetworkGateway1: {
      id: resourceId('Microsoft.Network/virtualNetworkGateways', 'vgw-secuty-public-vpnsec-trv-i')
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
