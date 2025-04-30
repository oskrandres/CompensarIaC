param afwName string
param location string = resourceGroup().location
param vnetName string
param subnetName string
param RGVnet string
param afwpName string
param zones array
param cr object
param pipName array
param ipgroup object
param VNGName string
param sku string
param vpnGatewayGeneration string
param lngName string
param vpnConnectionName string

module vnet 'modules/networking/vnet.bicep' = {
  name: 'deployVnet'
}

module afwpcr 'modules/afw/afwpcr.bicep' = {
  name: 'deployAFwPCR'
  params: {
    afwpName: afwpName
    cr: cr
  }
  dependsOn: [
    afwp
  ]
}

module afw 'modules/networking/firewall.bicep' = {
  name: 'AzureFirewallDeploy'
  scope: resourceGroup(RGVnet)
  params: {
    afwpName: afwpName
    location: location
    vnetName: vnetName
    subnetName: subnetName
    RGVnet: RGVnet
    pipName: pipName
    afwName: afwName
    zones: zones
    cr: cr
  }
  dependsOn: [
    pip
    afwp
    vnet
  ]
}

module afwp 'modules/afw/afwp.bicep' = {
  name: 'AzureFirewallPolicyDeploy'
  scope: resourceGroup(RGVnet)
  params: {
    location: location
    afwpName: afwpName
  }
  dependsOn: [
    ipgroups
  ]
}

module pip 'modules/networking/pip.bicep' = {
  name: 'DeployPip'
  scope: resourceGroup(RGVnet)
  params: {
    location: location
    pipName: pipName
  }
}

module ipgroups 'modules/networking/ipgroup.bicep' = {
  name: 'IpGroupDeploy'
  scope: resourceGroup(RGVnet)
  params: {
    ipgroup: ipgroup
    location: location
  }
}

module vng 'modules/networking/vng.bicep' = {
  name: 'deployVNGVPN'
  scope: resourceGroup(RGVnet)
  params: {
    location: location
    name: VNGName
    pipName: pipName
    sku: sku
    vnetName: vnetName
    vpnGatewayGeneration: vpnGatewayGeneration
  }
  dependsOn: [
    pip
    vnet
  ]
}

module lng 'modules/networking/lng.bicep' = {
  name: 'deployLNG'
  scope: resourceGroup(RGVnet)
  params: {
    location: location
    lngName: lngName
  }
}

module connectionVPN 'modules/networking/connVpn.bicep' = {
  name: 'deployConnVPN'
  scope: resourceGroup(RGVnet)
  params: {
    lngName: lngName
    location: location
    vngName: VNGName
    vpnConnectionName: vpnConnectionName
  }
  dependsOn: [
    lng
    vng
  ]
}
