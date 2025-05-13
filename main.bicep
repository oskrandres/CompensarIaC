param afwName string
param location string = resourceGroup().location
param vnetName string
param subnetName string
param RGVnet string
param afwpName string
param zones array
param cr object
param VnetSubnets array
param pipName array
param ipgroup object
param VNGName string
param sku string
param vpnGatewayGeneration string
param lngName string
param vpnConnectionName string
param tags object

module vnet 'modules/networking/vnet.bicep' = {
  name: 'deployVnet'
  params: {
    VnetSubnets: VnetSubnets
    location: location
    tags: tags
  }
}

module afwpcr 'modules/afw/afwpcr.bicep' = {
  name: 'deployAFwPCR'
  params: {
    afwpName: afwpName
    cr: cr
  }
  dependsOn: [
    afwp
    vnet
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
    tags: tags
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
    tags: tags
  }
}

module ipgroups 'modules/networking/ipgroup.bicep' = {
  name: 'IpGroupDeploy'
  scope: resourceGroup(RGVnet)
  params: {
    ipgroup: ipgroup
    location: location
    tags: tags
  }
}

module vng 'modules/networking/VPN_vng.bicep' = {
  name: 'deployVNGVPN'
  scope: resourceGroup(RGVnet)
  params: {
    location: location
    name: VNGName
    pipName: pipName[0]
    sku: sku
    vnetName: vnetName
    vpnGatewayGeneration: vpnGatewayGeneration
    tags: tags
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
    tags: tags
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
    tags: tags
  }
  dependsOn: [
    lng
    vng
  ]
}
