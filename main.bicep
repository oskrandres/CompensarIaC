param afwName string
param location string = resourceGroup().location
param vnetName string
param subnetName string
param RGVnet string
param afwpName string
param zones array
param cr object

module vnet 'vnet.bicep'= {
  name:'deployVnet'
}

module afwpcr 'afwpcr.bicep' = {
  name:'deployAFwPCR'
  params:{
    afwpName:afwpName
    cr:cr
  }
  dependsOn:[
    afwp
  ]
}


module afw 'firewall.bicep' = {
  name:'AzureFirewallDeploy'
  scope:resourceGroup(RGVnet)
  params:{
    afwpName:afwpName
    location:location
    vnetName:vnetName
    subnetName:subnetName
    RGVnet:RGVnet
    pipName:pipName[0]
    afwName:afwName
    zones:zones
    cr:cr
  }
  dependsOn:[
    pip
    afwp
    vnet
  ]
}


module afwp 'afwp.bicep' = {
  name:'AzureFirewallPolicyDeploy'
  scope:resourceGroup(RGVnet)
  params:{
    location:location
    afwpName:afwpName
  }
  dependsOn:[
    ipgroups
  ]
}

/*
Inicio Trozo despliegue de Ips públicas group
*/


/*
Inicio Trozo Ip públicas
*/
//param pips array
param pipName array

module pip 'pip.bicep' = {
  name:'DeployPip'
  scope:resourceGroup(RGVnet)
  params:{
    location:location
    pipName:pipName
  }
}

/*
Fin Trozo despliegue de Ips públicas group
*/


/*
Inicio Trozo Ip group
*/

param ipgroup object

module ipgroups 'ipgroup.bicep' = {
  name:'IpGroupDeploy'
  scope:resourceGroup(RGVnet)
  params:{
    ipgroup:ipgroup
    location:location
  }
}

/*
Fin Trozo Ip group
*/

/*
Inicio Trozo VNG VPN
*/
param VNGName string
param sku string
param vpnGatewayGeneration string

module vng 'vng.bicep' = {
  name:'deployVNGVPN'
  scope:resourceGroup(RGVnet)
  params:{
    location:location
    name:VNGName
    pipName:pipName[1]
    sku:sku
    vnetName:vnetName
    vpnGatewayGeneration:vpnGatewayGeneration
  }
  dependsOn:[
    pip
    vnet
  ]
}

/*
Fin Trozo VNG VPN
*/

/*
Inicio trozo LNG
*/

module lng  'lng.bicep' = {
  name:'deployLNG'
  scope:resourceGroup(RGVnet)
  params:{
    location:location
    lngName:lngName
  }
}
/*
Fin trozo LNG
*/

/*
Inicio trozo Connection
*/
param lngName string
param vpnConnectionName string

module connectionVPN 'connVpn.bicep' = {
  name:'deployConnVPN'
  scope:resourceGroup(RGVnet)
  params:{
    lngName:lngName
    location:location
    vngName:VNGName
    vpnConnectionName:vpnConnectionName
  }
  dependsOn:[
    lng
    vng
  ]
}
/*
Fin trozo Connection
*/
