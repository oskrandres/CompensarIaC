// Parámetros globales
param tags object
param resourceGroupIPGroups string

// Parámetros de IPGroups
param ipgroup object

// Modulo para desplegar IP Groups
module ipgroups 'modules/IpGroups.bicep' = {
  name: 'IpGroupDeploy'
  scope: resourceGroup(resourceGroupIPGroups)
  params: {
    ipgroup: ipgroup
    location: resourceGroup().location
    tags: tags
  }
}
