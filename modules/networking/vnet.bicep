param virtualNetworks_vnet_netwrk_centrl_main_trv_i_name string = 'vnet-netwrk-centrl-main-trv-i'

resource virtualNetworks_vnet_netwrk_centrl_main_trv_i_name_resource 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: virtualNetworks_vnet_netwrk_centrl_main_trv_i_name
  location: 'eastus2'
  tags: {
    APLICACION: 'netwrk'
    CAPACIDAD: 'platfr'
    'COD-APP-CMDB': 'SWPR000'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.204.0.0/20'
      ]
    }
    dhcpOptions: {
      dnsServers: [
        '10.204.3.4'
        '192.168.204.19'
        '168.63.129.16'
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: '10.204.0.128/27'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-public-trv-i'
        properties: {
          addressPrefix: '10.204.1.0/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-privte-trv-i'
        properties: {
          addressPrefix: '10.204.1.16/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-mngmnt-trv-i'
        properties: {
          addressPrefix: '10.204.1.32/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-syncro-trv-i'
        properties: {
          addressPrefix: '10.204.1.48/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-exrout-trv-i'
        properties: {
          addressPrefix: '10.204.1.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-firwll-sdwanf-dircon-trv-i'
        properties: {
          addressPrefix: '10.204.1.80/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-inbepa-trv-i'
        properties: {
          addressPrefix: '10.204.2.0/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-inbepb-trv-i'
        properties: {
          addressPrefix: '10.204.2.16/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-inbepc-trv-i'
        properties: {
          addressPrefix: '10.204.2.32/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-inbepd-trv-i'
        properties: {
          addressPrefix: '10.204.2.48/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-outepa-trv-i'
        properties: {
          addressPrefix: '10.204.2.64/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-mngmnt-trv-i'
        properties: {
          addressPrefix: '10.204.3.0/26'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-outepd-trv-i'
        properties: {
          addressPrefix: '10.204.2.112/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-outepc-trv-i'
        properties: {
          addressPrefix: '10.204.2.96/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-dnspra-outepb-trv-i'
        properties: {
          addressPrefix: '10.204.2.80/28'
          serviceEndpoints: []
          delegations: [
            {
              name: 'Microsoft.Network.dnsResolvers'
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-datbse-trv-i'
        properties: {
          addressPrefix: '10.204.3.128/26'
          serviceEndpoints: [
            {
              service: 'Microsoft.AzureCosmosDB'
              locations: [
                '*'
              ]
            }
            {
              service: 'Microsoft.Storage'
              locations: [
                'eastus2'
                'centralus'
              ]
            }
            {
              service: 'Microsoft.Sql'
              locations: [
                'eastus2'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-stoacc-trv-i'
        properties: {
          addressPrefix: '10.204.3.192/26'
          serviceEndpoints: [
            {
              service: 'Microsoft.AzureCosmosDB'
              locations: [
                '*'
              ]
            }
            {
              service: 'Microsoft.Storage'
              locations: [
                'eastus2'
                'centralus'
              ]
            }
            {
              service: 'Microsoft.Sql'
              locations: [
                'eastus2'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-temprb-gclint-trv-i'
        properties: {
          addressPrefix: '10.204.5.224/28'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
              locations: [
                'eastus2'
                'centralus'
              ]
            }
          ]
          delegations: [
            {
              name: 'delegation'
              properties: {
                serviceName: 'Microsoft.Web/serverfarms'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-tempra-jmeter-trv-i'
        properties: {
          addressPrefix: '10.204.5.240/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-vaults-trv-i'
        properties: {
          addressPrefix: '10.204.4.0/27'
          serviceEndpoints: [
            {
              service: 'Microsoft.KeyVault'
              locations: [
                '*'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-applic-trv-i'
        properties: {
          addressPrefix: '10.204.3.64/26'
          serviceEndpoints: [
            {
              service: 'Microsoft.Web'
              locations: [
                '*'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'NetworkSecurityGroupEnabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: '10.204.1.128/26'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'snet-netwrk-centrl-agwpub-trv-i'
        properties: {
          addressPrefix: '10.204.0.0/26'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    enableDdosProtection: false
  }
}
