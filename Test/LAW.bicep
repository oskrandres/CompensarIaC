
@description('Nombre del grupo de recursos')
param resourceGroupName string = 'rg-platfr-netwrk-centrl-trv-i'

@description('Nombre del Log Analytics Workspace')
param logAnalyticsWorkspaceName string = 'log-secuty-public-centrl-trv-i'

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

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}
