
param location string = resourceGroup().location

var azureFirewallName = 'afw-secuty-public-centrl-trv-i'
var publicIPName = 'pip-afw-secuty-public-centrl-trv-i'
var firewallPolicyName = 'afwp-afw-secuty-public-centrl-trv-i'
var vnetName = 'vnet-netwrk-centrl-main-trv-i'
var subnetName = 'AzureFirewallSubnet'

resource publicIP 'Microsoft.Network/publicIPAddresses@2024-05-01' existing = {
  name: publicIPName
}

resource firewallPolicy 'Microsoft.Network/firewallPolicies@2022-09-01' existing = {
  name: firewallPolicyName
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: vnetName
}

resource azureFirewall 'Microsoft.Network/azureFirewalls@2024-05-01' = {
  name: azureFirewallName
  location: location
  zones: [
    '1'
    '2'
    '3'
  ]
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    threatIntelMode: 'Alert'
    ipConfigurations: [
      {
        name: 'ip-${azureFirewallName}'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
          subnet: {
            id: '${vnet.id}/subnets/${subnetName}'
          }
        }
      }
    ]
    firewallPolicy: {
      id: firewallPolicy.id
    }
    networkRuleCollections: []
    applicationRuleCollections: []
    natRuleCollections: []
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
