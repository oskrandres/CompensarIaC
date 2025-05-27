param location string = resourceGroup().location
param firewallPolicies_afwpazurecorptransversal_name string = 'afwpazurecorptransversal'
param workspaces_loga_azfirerwall_transversal_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.OperationalInsights/workspaces/loga-azfirerwall-transversal'
param ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-DEV'
param ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-TEST'
param ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-PROD'
param ipGroups_ipgroup_AZ_TRANSVERSAL_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-AZ_TRANSVERSAL'
param ipGroups_ipgroup_OP_PERFORMANCE_TEST_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-OP_PERFORMANCE_TEST'
param ipGroups_ipgroup_IPSECFACILITA_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-IPSECFACILITA'
param ipGroups_ipgroup_AZ_PROD_DOMAIN_CONTROLLERS_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-AZ_PROD_DOMAIN_CONTROLLERS'
param ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid string = '/subscriptions/e23d8cf5-3d42-4a5b-8de9-3c007188e17e/resourceGroups/Network_Transversal/providers/Microsoft.Network/ipGroups/ipgroup-OP_PROD_DOMAIN_CONTROLLERS'

resource firewallPolicies_afwpazurecorptransversal_name_resource 'Microsoft.Network/firewallPolicies@2024-05-01' = {
  name: firewallPolicies_afwpazurecorptransversal_name
  location: location
  properties: {
    sku: {
      tier: 'Standard'
    }
    threatIntelMode: 'Alert'
    dnsSettings: {
      servers: []
      enableProxy: true
    }
    insights: {
      isEnabled: true
      retentionDays: 30
      logAnalyticsResources: {
        workspaces: [
          {
            region: location
            workspaceId: {
              id: workspaces_loga_azfirerwall_transversal_externalid
            }
          }
        ]
        defaultWorkspaceId: {
          id: workspaces_loga_azfirerwall_transversal_externalid
        }
      }
    }
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_ApplicationRule_NUEVAS_REGLAS_MIGRACION 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'ApplicationRule_NUEVAS_REGLAS_MIGRACION'
  
  properties: {
    priority: 5500
    ruleCollections: []
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_ApplicationRuleCollectionGroup_GLOBAL 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'ApplicationRuleCollectionGroup-GLOBAL'
  location: location
  properties: {
    priority: 5100
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-internet-fqdn-tag-microsoft'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            fqdnTags: [
              'AppServiceEnvironment'
              'AzureBackup'
              'AzureKubernetesService'
              'HDInsight'
              'MicrosoftActiveProtectionService'
              'Windows365'
              'WindowsDiagnostics'
              'WindowsUpdate'
              'WindowsVirtualDesktop'
              'Office365.Exchange.Optimize'
              'Office365.Exchange.Allow.Required'
              'Office365.Exchange.Default.Required'
              'Office365.Skype.Allow.Required'
              'Office365.Skype.Default.Required'
              'Office365.Skype.Default.NotRequired'
              'Office365.Skype.Allow.NotRequired'
              'Office365.SharePoint.Optimize'
              'Office365.SharePoint.Default.NotRequired'
              'Office365.SharePoint.Default.Required'
              'Office365.Common.Default.NotRequired'
              'Office365.Common.Allow.Required'
              'Office365.Common.Default.Required'
            ]
            webCategories: []
            targetFqdns: []
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rule-az-spokes-to-internet-fqdn-tag'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-computers+technology'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            fqdnTags: []
            webCategories: [
              'computersandtechnology'
            ]
            targetFqdns: []
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-informationsecurity'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: [
              'informationsecurity'
            ]
            targetFqdns: []
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rule-az-spokes-to-internet-web-categories'
        priority: 105
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-broadcom.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.broadcom.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-tableau.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.tableau.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-kaspersky.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.kaspersky.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-google.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.google.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-microsoft.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.microsoft.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-licensing.tableau.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.licensing.tableau.com'
              '*.ss2.us'
              '*.rootca1.amazontrust.com'
              '*.sca1b.amazontrust.com'
              '*.sca0a.amazontrust.com'
              '*.sca1a.amazontrust.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-debian.org'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Http'
                port: 80
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.debian.org'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-compensar.co'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensar.co'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-compensar.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensar.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-smtp-mail.outlook.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 587
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.outlook.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-stellarcyber.cloud'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.stellarcyber.cloud'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-gserviceaccount.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.gserviceaccount.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-googleapis.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.googleapis.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-smtp-office365.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 587
              }
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.office365.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-compensarsalud.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensarsalud.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-amazoncognito.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.amazoncognito.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-pruaws.compensar.co'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.pruaws.compensar.co'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-prdaws.compensar.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.prdaws.compensar.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-grupoemi.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Https'
                port: 6078
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.grupoemi.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-spokes-to-e-collect.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
              {
                protocolType: 'Https'
                port: 445
              }
              {
                protocolType: 'Https'
                port: 22
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.e-collect.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: []
            destinationAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
            ]
            httpHeadersToInsert: []
          }
        ]
        name: 'rule-az-spokes-to-internet-url'
        priority: 110
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_ApplicationRuleCollectionGroup_TERCEROS 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'ApplicationRuleCollectionGroup-TERCEROS'
  location: location
  properties: {
    priority: 5200
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'ApplicationRule'
            name: 'rule-az-aks-spokes-to-compensarsalud.com'
            protocols: [
              {
                protocolType: 'Https'
                port: 443
              }
            ]
            fqdnTags: []
            webCategories: []
            targetFqdns: [
              '*.compensarsalud.com'
            ]
            targetUrls: []
            terminateTLS: false
            sourceAddresses: [
              '10.89.16.0/20'
              '10.89.144.0/20'
              '10.203.16.0/20'
            ]
            destinationAddresses: []
            sourceIpGroups: []
            httpHeadersToInsert: []
          }
        ]
        name: 'rule-az-spokes-to-internet-url'
        priority: 100
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRule_NUEVAS_REGLAS_MIGRACION 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRule_NUEVAS_REGLAS_MIGRACION'
  location: location
  properties: {
    priority: 4500
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-bibanp-tst-to-csalud-ip-dvl'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.224.132'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.5.33'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-bibanp-tst-to-csalud-fqdn-dvl'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.224.132'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'stcsaludcarinibkupdbdvli.blob.core.windows.net'
            ]
            destinationPorts: [
              '443'
              '53'
            ]
          }
        ]
        name: 'rule-biba-bibanp'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-centrl-st-dvl-i-to-centrl-app-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.5.0/24'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '172.27.224.128/25'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-to-Salud'
        priority: 250
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmapcordoba-to-ecollect'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.28'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'batch.e-collect.com'
            ]
            destinationPorts: [
              '22'
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmtoledo-to-ecollect'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.35'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'batch.e-collect.com'
            ]
            destinationPorts: [
              '22'
              '445'
            ]
          }
        ]
        name: 'rule-biba-bibaf3'
        priority: 300
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-adf-consol-centrl-inload-dvl-to-vm-csalud-carini-inload-dvl'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.13'
              '10.89.2.21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.4.23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rule-consol-centrl-inload-dvl'
        priority: 220
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-maskng-to-mdmebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.7'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.23.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-pamc-mdm-ebxtdv'
        priority: 225
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-azuredvltst-to-prpaws'
            ipProtocols: [
              'TCP'
              'ICMP'
            ]
            sourceAddresses: [
              '10.89.2.35'
              '10.89.130.28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.24.80.0/20'
              '10.24.32.0/20'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '1434'
              '5432'
              '27017'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-azureprd-to-prdaws'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.203.2.0/23'
              '10.203.32.0/24'
              '10.203.32.0/24'
              '10.203.33.0/24'
              '10.203.2.29'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.21.43.82'
              '10.21.94.32'
              '10.21.43.84'
              '10.21.87.87'
              '10.21.46.39'
              '10.21.35.23'
              '10.21.80.212'
              '10.21.41.57'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '27017'
              '5432'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-azureprd-to-prdaws2'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.29'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.21.32.0/20'
              '10.21.80.0/20'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '1434'
              '5432'
              '27017'
            ]
          }
        ]
        name: 'rule-azure-to-aws'
        priority: 230
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-csalud-tst-to-bibanp-ip-tst'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.89.133.97'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '172.27.224.132'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-csalud-tst-to-bibanp-fqdn-tst'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.89.133.97'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'df-biba-np.eastus2.datafactory.azure.net'
            ]
            destinationPorts: [
              '443'
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-csalud-prd-to-bibanp-ip-prd'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.203.2.47'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '172.27.243.133'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-csalud-prd-to-bibanp-fqdn-prd'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.203.2.47'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'storbibareplicas.privatelink.blob.core.windows.net'
            ]
            destinationPorts: [
              '443'
              '53'
            ]
          }
        ]
        name: 'rule-csalud-to-bibanp'
        priority: 235
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-dev-to-digiturno'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.35'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.4'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-tst-to-digiturno'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.4'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-prd-to-digiturno'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.29'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.4'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rule-to-digiturno'
        priority: 200
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-dvl'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.35/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.65/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-tst'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.28/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.65/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-prd'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.29/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.224.66/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-dvl02'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.35/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.238.94.6/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-tst02'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.28/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.238.94.6/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-to-DigitalWareAndromeda-ip-prd02'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.29/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.238.90.198/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1733'
            ]
          }
        ]
        name: 'rule-to-DigitalWareAndromeda'
        priority: 240
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_AUDIT 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-AUDIT'
  location: location
  properties: {
    priority: 4100
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-soc-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
              'Any'
            ]
            sourceAddresses: [
              '192.168.173.161'
              '192.168.173.168'
              '192.168.173.169'
              '192.168.173.162'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-motoresnexpose-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
              'Any'
            ]
            sourceAddresses: [
              '192.168.204.17'
              '192.168.204.246'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-consolanexpose-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
              'Any'
            ]
            sourceAddresses: [
              '192.168.204.86'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
        ]
        name: 'rule-op-vulnerability-scanner-to-az-spokes'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-testsqa-to-az-spokes'
            ipProtocols: [
              'TCP'
              'Any'
              'ICMP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_OP_PERFORMANCE_TEST_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '443'
              '5671'
              '5672'
              '9093'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-testsqa-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
              'Any'
            ]
            sourceAddresses: [
              '10.204.5.240/28'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '443'
              '5671'
              '5672'
              '9093'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-testsqa-to-az-spokes-akstdv'
            ipProtocols: [
              'TCP'
              'ICMP'
            ]
            sourceAddresses: [
              '10.204.5.240/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.20.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '9400'
              '9401'
              '9402'
              '9403'
              '30143'
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-testsqa-to-op-fsprd'
            ipProtocols: [
              'TCP'
              'ICMP'
            ]
            sourceAddresses: [
              '10.204.5.240/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.10.5'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '139'
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-testsqa-to-op-stebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.5.240/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '445'
            ]
          }
        ]
        name: 'rule-op-testperformance-to-az-spokes'
        priority: 110
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_DEV_IaC 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-DEV-IaC'
  location: location
  properties: {
    priority: 3900
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-dbw-financ-dkcart-transc-to-op-vmdvaupes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '445'
            ]
          }
        ]
        name: 'rule-bibatr-financ-dkcart'
        priority: 155
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-bucket-consolidador'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.201'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-pamc-consolidador'
        priority: 270
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-ebx-to-op-nam-sso'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.116'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '8443'
            ]
          }
        ]
        name: 'rule-pamc-nam-sso'
        priority: 250
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-func-logsce-central-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.13.160/27'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rule-logsce-central'
        priority: 280
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-func-syncro-stream-transc-to-bd-comclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.12.32/27'
              '10.89.13.96/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.20.238'
              '192.168.20.230'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rule-gclint-syncro-stream'
        priority: 300
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-bibaf2-vm\'s-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.12'
              '192.168.208.57'
              '192.168.209.24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.2.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.2.0/23'
              '10.89.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.2.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-biba-bibaf2'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'aks-medpre-transv-manage-to-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.3.17'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-rg-csalud-medpre'
        priority: 271
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.78/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'esbintprutls.compensar.com'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-portal'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.35'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-rg-csalud-medprd'
        priority: 355
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-central-to-rmq.cloudamqp.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.16.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'trendy-gold-bobcat.rmq2.cloudamqp.com'
            ]
            destinationPorts: [
              '443'
              '5671'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-central-to-gclientespru.compensar.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.16.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.13'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmdrhesb01-to-ip-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.119/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.1.4/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmdrhesb01-to-fqdn-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.119/32'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'api-transv-introp.dvlaz.compensar.int'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-introp-central'
        priority: 305
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-ebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.20.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-tdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.20.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '9400'
              '9402'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-etlbd-to-st-mdmebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.201'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '139'
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebx-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.20.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '52.96.0.0/16'
              '40.104.46.70'
              '40.99.232.114'
              '40.97.4.6'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '587'
              '25'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wificsde-to-mdmebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.20.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '9400'
              '9402'
            ]
          }
        ]
        name: 'rule-pamc-mdm-ebxtdv'
        priority: 260
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_EXTERNAL 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-EXTERNAL'
  location: location
  properties: {
    priority: 2500
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
        name: 'rule-dlv-i-compensar-salud'
        priority: 3900
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-evtt-to-spoke-aks-medpre'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.27.216.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.24.0/22'
              '10.89.152.0/22'
              '10.203.24.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-tercero-consorcio-salud'
        priority: 3000
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_GLOBAL 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-GLOBAL'
  location: location
  properties: {
    priority: 1100
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-az-dc'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-dc-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-op-dc'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-dc-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '42'
              '53'
              '88'
              '123'
              '135'
              '137'
              '138'
              '139'
              '389'
              '445'
              '464'
              '500'
              '636'
              '3268'
              '3269'
              '3389'
              '4500'
              '1024-5000'
              '49152-65535'
            ]
          }
        ]
        name: 'rule-az-spokes-to-domain-controllers'
        priority: 105
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-dns-az'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-dns-op'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-dns-internet'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: [
              '168.63.129.16'
              '1.1.1.1'
              '8.8.8.8'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
        ]
        name: 'rule-az-spokes-to-dns-resolution'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-snet-adb-iac-to-small-ivory-gazelle.rmq3.cloudamqp.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            destinationAddresses: [
              '20.110.121.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '5672'
            ]
          }
        ]
        name: 'rule-az-spokes-to-rabbit-rmq3'
        priority: 135
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-to-op-dns-conditional-forwarder'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.204.2.0/25'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-to-az-dns-conditional-forwarder'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_OP_PROD_DOMAIN_CONTROLLERS_externalid
            ]
            destinationAddresses: [
              '10.204.2.0/25'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-transversal-to-az-spokes'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-az-transversal'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '53'
            ]
          }
        ]
        name: 'rule-az-spokes-to-dns-resolver'
        priority: 110
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-snet-adb-iac-to-microsoft-databricks-sqlagent'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.8.0/22'
              '10.89.136.0/22'
              '10.203.8.0/22'
              '10.205.8.0/22'
              '10.89.32.0/22'
              '10.89.160.0/22'
              '10.203.32.0/22'
              '10.205.32.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.70.0.0/16'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '3306'
              '9093'
            ]
          }
        ]
        name: 'rule-az-spokes-to-databricks-agent'
        priority: 130
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-azure-apimgmnt-microsoftmetrics.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.1.0/28'
              '10.89.129.0/28'
              '10.205.1.0/28'
              '10.203.1.0/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '52.183.41.0/24'
              '13.92.0.0/16'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1886'
            ]
          }
        ]
        name: 'rule-az-spokes-to-azure-apimgmnt-agent'
        priority: 140
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-cm-gammacsoc.stellarcyber.cloud'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'cm-gammacsoc.stellarcyber.cloud'
            ]
            destinationPorts: [
              '443'
              '6640'
              '6641'
              '6642'
              '6643'
              '6644'
              '6645'
              '6646'
              '6647'
              '6648'
              '8443'
              '8888'
              '8889'
            ]
          }
        ]
        name: 'rule-az-spokes-to-stellarcyber.cloud'
        priority: 145
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-vnet-main-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationFqdns: []
            destinationPorts: [
              '22'
              '53'
              '80'
              '135'
              '443'
              '1000'
              '1433'
              '2179'
              '2382'
              '2383'
              '3389'
              '6380'
              '6901'
              '6910'
              '8080'
              '8081'
              '8100'
              '9050'
              '9191'
              '10000-20000'
              '17012'
              '49152-65535'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-subnet-cosmos-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.4.0/24'
              '10.89.132.0/24'
              '10.203.4.0/24'
              '10.205.4.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-subnet-postgres-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.5'
              '10.204.3.6'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.6.0/28'
              '10.89.134.0/28'
              '10.205.6.0/28'
              '10.203.6.0/28'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '5432'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-snet-netwrk-centrl-db-dvl-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.225'
              '192.168.204.227'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.4.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-snet-netwrk-centrl-db-tst-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.225'
              '192.168.204.227'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.132.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-snet-netwrk-centrl-db-prp-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.225'
              '192.168.204.227'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.205.4.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-devops-to-spoke-snet-netwrk-centrl-db-prd-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.225'
              '192.168.204.227'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.4.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rule-az-spokes-to-devops-agent'
        priority: 125
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-spokes-to-kav-antivirus'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid
              ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid
              ipGroups_ipgroup_AZ_TRANSVERSAL_externalid
            ]
            destinationAddresses: [
              '192.168.204.71'
              '192.168.204.99'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '80'
              '135'
              '445'
              '7271'
              '13000'
              '13111'
              '14000'
              '15000'
              '16000'
              '17000'
              '17111'
              '19000'
              '51000-52000'
            ]
          }
        ]
        name: 'rule-az-spokes-to-kav-antivirus'
        priority: 115
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_MGMNT 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-MGMNT'
  location: location
  properties: {
    priority: 2000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-spokes-snet-management'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.200.60.0/27'
              '10.204.0.0/21'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '443'
              '3389'
            ]
          }
        ]
        name: 'rule-op-vpn-globalprotect-to-az-spoke-transversal'
        priority: 115
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-spokes-snet-app/dmz-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.0.0/22'
              '10.89.128.0/22'
              '10.203.0.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '443'
              '3389'
              '8080'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-spokes-snet-trv-iac/manual'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.200.60.0/24'
              '10.204.0.0/21'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '443'
              '3389'
              '8080'
            ]
          }
        ]
        name: 'rule-op-wifi-corp-to-az-spokes'
        priority: 105
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-spokes-snet-management'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.200.60.0/27'
              '10.204.1.32/28'
              '10.89.0.0/21'
              '10.89.128.0/21'
              '10.203.0.0/21'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '443'
              '3389'
            ]
          }
        ]
        name: 'rule-op-vpn-facilita-to-az-spoke-transversal'
        priority: 120
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-bastion-to-spokes-snet-app/dmz-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.7'
              '192.168.204.13'
              '192.168.204.112'
              '192.168.204.180'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.0.0/21'
              '10.89.128.0/21'
              '10.203.0.0/21'
              '10.204.0.0/21'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '135'
              '443'
              '445'
              '1433'
              '1434'
              '3389'
              '5432'
              '5433'
              '8080'
            ]
          }
        ]
        name: 'rule-op-bastion-to-az-spokes'
        priority: 100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-spokes-snet-app/dmz-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.0.0/22'
              '10.89.128.0/22'
              '10.203.0.0/22'
              '10.205.0.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '22'
              '443'
              '3389'
              '5671'
              '5672'
              '8080'
              '9093'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-spokes-snet-db/storage-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.4.0/22'
              '10.89.132.0/22'
              '10.203.4.0/22'
              '10.205.4.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '135'
              '139'
              '445'
              '1433'
              '1434'
              '4022'
              '5432'
              '5433'
              '6380'
              '11000-11999'
              '3389'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-spokes-snet-aks/aks-iac'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.16.0/20'
              '10.89.144.0/20'
              '10.205.16.0/20'
              '10.203.16.0/20'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '80'
              '443'
              '8080'
              '9400'
              '9401'
              '9402'
              '9403'
              '9404'
              '9408'
              '30143'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-vnet-netwrk-centrl-main-poc-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.204.240.0/20'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-op-vpn-globalprotect-to-az-spokes'
        priority: 110
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_PROD_IaC 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-PROD-IaC'
  location: location
  properties: {
    priority: 900
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-ebx-to-op-nam-sso'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '127.1.1.1'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-pamc-nam-sso'
        priority: 250
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-dbw-financ-dkcart-transc-to-op-apusfs'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.10.50'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '445'
            ]
          }
        ]
        name: 'rule-bibatr-financ-dkcart'
        priority: 155
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-bibaf2-vm\'s-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.207.7'
              '192.168.207.19'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.203.2.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.2.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.2.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-vmaplesoto-to-ecollect'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.2.29'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'batch.e-collect.com'
            ]
            destinationPorts: [
              '445'
              '22'
            ]
          }
        ]
        name: 'rule-biba-bibaf2'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: ' rule-az-func-logsce-central-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.13.160/27'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rule-logsce-central'
        priority: 260
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-func-syncro-stream-transc-to-bd-comclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.12.32/27'
              '10.203.13.96/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.207.23'
              '192.168.207.21'
              '192.168.207.20'
              '192.168.207.19'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-bdclie-syncro-stream-to-smb-vmgmacao'
            ipProtocols: [
              'TCP'
              'UDP'
            ]
            sourceAddresses: [
              '10.203.4.0/24'
              '10.203.2.0/23'
              '10.204.5.240/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.204.0/24'
              '192.168.207.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-etl_clientes_to_az_storage_sync'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.207.124'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-gclint-syncro-stream'
        priority: 300
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.3.17/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.24.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'esbintprdtls.compensar.com'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-rg-csalud-medprd'
        priority: 355
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-central-to-gclientes.compensar.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.16.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.4.8'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpresbdb-to-ip-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.240/32'
              '172.18.162.241/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.1.4/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpresbdb-to-fqdn-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.240/32'
              '172.18.162.241/32'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'api-transv-introp.prdaz.compensar.int'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-introp-central'
        priority: 308
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-ebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.203.23.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-tdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.203.23.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '9400'
              '9401'
              '9402'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-aks-ebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.23.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-aks-tdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.203.23.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '9400'
              '9401'
              '9402'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: ' rule-aks-ebx-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.203.20.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wificsde-to-mdmebxtdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.148.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '9400'
              '9402'
            ]
          }
        ]
        name: 'rule-pamc-mdm-ebxtdv'
        priority: 350
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_TEST 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-TEST'
  location: location
  properties: {
    priority: 3000
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'Temp_App_Service_GClient'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.5.224/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.0.0/21'
              '10.89.128.0/21'
              '10.203.0.0/21'
              '192.168.20.238'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '1433'
            ]
          }
        ]
        name: 'rule-Temp_App_Service_GClient'
        priority: 160
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'Logic-App-To-Cosmos-DB'
            ipProtocols: [
              'TCP'
              'UDP'
              'ICMP'
              'Any'
            ]
            sourceAddresses: [
              '10.204.243.144/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.132.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '*'
            ]
          }
        ]
        name: 'rule-Temp_POC-Logic-App-To-Cosmos-DB'
        priority: 170
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_TEST_IaC 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-TEST-IaC'
  location: location
  properties: {
    priority: 2900
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-bot-vmgkigali-to-az-pamc-app'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.204.74'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.130.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '30143'
            ]
          }
        ]
        name: 'rule-pamc-app'
        priority: 255
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-dbw-financ-dkcart-transc-to-op-vmdvaupes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '445'
            ]
          }
        ]
        name: 'rule-bibatr-financ-dkcart'
        priority: 155
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-ebx-to-op-nam-sso'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.75'
              '192.168.1.76'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-pamc-nam-sso'
        priority: 250
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: ' rule-az-func-logsce-central-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.141.160/27'
              '10.205.13.160/27'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '587'
            ]
          }
        ]
        name: 'rule-logsce-central'
        priority: 280
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-func-syncro-stream-transc-to-bd-comclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.140.32/27'
              '10.205.12.32/27'
              '10.89.141.96/28'
              '10.205.13.96/28'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.12'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-etl_clientes_to_az_storage_sync '
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.100'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.133.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-etl_clientes_to_az_storage_sync-prp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.208.100'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.205.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-gclint-syncro-stream'
        priority: 300
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-bibaf2-vm\'s-to-op-bdsqlclientes'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.130.0/23'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.12'
              '192.168.208.57'
              '192.168.209.24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.130.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-globalprotectprisma-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.250.1.0/24'
              '10.82.0.0/19'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.130.0/23'
              '10.89.133.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wifi-corp-to-tableau-vm'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.130.0/23'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vlan-pcc-to-pe-synapse'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.238.128/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.132.6'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '1433'
            ]
          }
        ]
        name: 'rule-biba-bibaf2'
        priority: 150
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.152.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.78/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'aks-medprd-transv-manage-to-op-bus-tibco-i'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.152.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'esbintprutls.compensar.com'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-rg-csalud-medprd'
        priority: 355
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-central-to-gclientespru.compensar.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.144.0/22'
              '10.205.16.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.1.13'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-introp-central-to-rmq.cloudamqp.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.144.0/22'
              '10.205.16.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'bossy-lime-crocodile.rmq3.cloudamqp.com'
            ]
            destinationPorts: [
              '443'
              '5671'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmprurhesb01-to-ip-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.148/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.129.4/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmprurhesb01-to-fqdn-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.148/32'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'api-transv-introp.tstaz.compensar.int'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpprhesbbw01-to-ip-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.194/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.205.1.4/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpprhesbbw01-to-fqdn-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.194/32'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'api-transv-introp.prpaz.compensar.int'
            ]
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpprhesbbw02-to-ip-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.195/32'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.205.1.4/32'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vmpprhesbbw02-to-fqdn-api-transv-introp'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '172.18.162.195/32'
            ]
            sourceIpGroups: []
            destinationAddresses: []
            destinationIpGroups: []
            destinationFqdns: [
              'api-transv-introp.prpaz.compensar.int'
            ]
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-introp-central'
        priority: 308
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-ebx'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.148.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-vpn-facilita-to-aks-tdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: []
            sourceIpGroups: [
              ipGroups_ipgroup_IPSECFACILITA_externalid
            ]
            destinationAddresses: [
              '10.89.148.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '9400'
              '9402'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-aks-ebx-to-smtp-outook.com'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.89.148.0/22'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '40.96.0.0/13'
              '40.104.0.0/15'
              '52.96.0.0/14'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '587'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-op-wificsde-to-mdmebxtdv'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '192.168.240.0/21'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.148.0/22'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
              '9400'
              '9402'
            ]
          }
        ]
        name: 'rule-pamc-mdm-ebxtdv'
        priority: 200
      }
    ]
  }
}

resource firewallPolicies_afwpazurecorptransversal_name_NetworkRuleCollectionGroup_TRV_IaC 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'NetworkRuleCollectionGroup-TRV-IaC'
  location: location
  properties: {
    priority: 1900
    ruleCollections: [
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-purview-to-on-premise-intgruntime'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.64/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.20.61'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-az-hub-to-on-premise-dvl'
        priority: 3100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-purview-to-on-premise-intgruntime'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.64/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.111'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-az-hub-to-on-premise-tst'
        priority: 2100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: []
        name: 'rule-az-hub-to-on-premise-prd'
        priority: 1100
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VSQLAVGPRU01'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.12'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDUSUMACINTA'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.209.30'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '8284'
              '8290'
              '53367'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDMILES'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.205'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDLIBERIA'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.108'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '60745'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDMOCOA'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.209.24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDVAUPES'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.19.37'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '445'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VPRUXCARET'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.91'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '8085'
              '8284'
              '8290'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VPRUXPLOR'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.92'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '57869'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMPRUJANABIYAH'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.70'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMPRULISBOA'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.109'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
              '8290'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMPRUDUTU'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.57'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VPRUPANDORA'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.37'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '51433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMDKIOTO'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.209.50'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VSQLAVGPRUKATIO'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.110'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '59162'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMPRUCHAPINERO '
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.151'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-vm-mgment-govern-intrun-to-op-VMPRUGRECO '
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.3.69'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '192.168.208.150'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '1433'
            ]
          }
        ]
        name: 'rule-az-mgment-govern-intrun'
        priority: 1200
      }
      {
        ruleCollectionType: 'FirewallPolicyFilterRuleCollection'
        action: {
          type: 'Allow'
        }
        rules: [
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-appgw-to-az-spokes-apimgmnt'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.1.0/28'
              '10.89.129.0/28'
              '10.205.1.0/28'
              '10.203.1.0/28'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-appgw-to-az-spokes-snet-vault'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.1.128/25'
              '10.89.129.128/25'
              '10.205.1.128/25'
              '10.203.1.128/25'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-appgw-to-az-spokes-aks-medpre'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.27.250'
              '10.89.155.250'
              '10.203.27.250'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
          {
            ruleType: 'NetworkRule'
            name: 'rule-az-hub-appgw-to-az-spokes-st-medpre'
            ipProtocols: [
              'TCP'
            ]
            sourceAddresses: [
              '10.204.0.0/26'
            ]
            sourceIpGroups: []
            destinationAddresses: [
              '10.89.5.0/24'
              '10.89.133.0/24'
              '10.203.5.0/24'
            ]
            destinationIpGroups: []
            destinationFqdns: []
            destinationPorts: [
              '443'
            ]
          }
        ]
        name: 'rule-az-hub-to-spokes-app'
        priority: 100
      }
    ]
  }
}
