//En este ejemplo se usa la suscripcion de Oscar y el RG definido, solo se deben crear los IP Groups
// para que funcione el template, se pueden crear los IP Groups con el siguiente template:
// CodigoDesacoplado/Fase1/1-IPgroups.bicep


// Datos de prueba de Oscar Medina
param subscriptionId string = '18bf3718-f695-4c96-8d45-72dc2e617d2e'

//RG
param RG string = 'rg-platfr-secuty-privte-trv-i'

//Firewall Policy
param firewallPolicyName string = 'afwp-afw-secuty-public-centrl-trv-i'

//IPGroups
param ipGroups_ipgroup_AZ_SPOKE_MAIN_DEV_externalid string = '/subscriptions/${subscriptionId}/resourceGroups/${RG}/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-DEV'
param ipGroups_ipgroup_AZ_SPOKE_MAIN_TEST_externalid string = '/subscriptions/${subscriptionId}/resourceGroups/${RG}/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-TEST'
param ipGroups_ipgroup_AZ_SPOKE_MAIN_PROD_externalid string = '/subscriptions/${subscriptionId}/resourceGroups/${RG}/providers/Microsoft.Network/ipGroups/ipgroup-AZ_SPOKE-MAIN-PROD'
param ipGroups_ipgroup_AZ_TRANSVERSAL_externalid string = '/subscriptions/${subscriptionId}/resourceGroups/${RG}/providers/Microsoft.Network/ipGroups/ipgroup-AZ_TRANSVERSAL'

resource firewallPolicies_afwpazurecorptransversal_name_resource 'Microsoft.Network/firewallPolicies@2024-01-01' existing = {
  name: firewallPolicyName
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
  dependsOn: [
    firewallPolicies_afwpazurecorptransversal_name_ApplicationRule_NUEVAS_REGLAS_MIGRACION
  ]
}

resource firewallPolicies_afwpazurecorptransversal_name_ApplicationRuleCollectionGroup_TERCEROS 'Microsoft.Network/firewallPolicies/ruleCollectionGroups@2024-05-01' = {
  parent: firewallPolicies_afwpazurecorptransversal_name_resource
  name: 'ApplicationRuleCollectionGroup-TERCEROS'
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
  dependsOn: [
    firewallPolicies_afwpazurecorptransversal_name_ApplicationRule_NUEVAS_REGLAS_MIGRACION
    firewallPolicies_afwpazurecorptransversal_name_ApplicationRuleCollectionGroup_GLOBAL
  ]
}
