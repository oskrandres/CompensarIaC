
@description('Nombre del Azure Firewall')
param firewallName string = 'afw-secuty-public-centrl-trv-i'

@description('Nombre del grupo de recursos')
param resourceGroupName string = 'rg-platfr-secuty-public-trv-i'

@description('Nombre de la IP pública')
param publicIpName string = 'pip-afw-secuty-public-centrl-trv-i'

@description('Nombre de la política de firewall existente')
param firewallPolicyName string = 'afwp-afw-secuty-public-centrl-trv-i'

@description('Nombre de la VNet existente')
param vnetName string = 'vnet-netwrk-centrl-main-trv-i'

@description('Nombre de la subred de Azure Firewall')
param subnetName string = 'AzureFirewallSubnet'

var location = resourceGroup().location

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

resource publicIp 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: publicIpName
  location: location
  tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource firewallPolicy 'Microsoft.Network/firewallPolicies@2022-05-01' existing = {
  name: firewallPolicyName
  scope: resourceGroup(resourceGroupName)
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' existing = {
  name: vnetName
  scope: resourceGroup(resourceGroupName)
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' existing = {
  parent: vnet
  name: subnetName
}

resource azureFirewall 'Microsoft.Network/azureFirewalls@2022-05-01' = {
  name: firewallName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    firewallPolicy: {
      id: firewallPolicy.id
    }
    ipConfigurations: [
      {
        name: 'azureFirewallIpConfiguration'
        properties: {
          subnet: {
            id: subnet.id
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
  }
}
