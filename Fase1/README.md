# FASE 1

### Pre Requesitos

Azure CLI
Bicep

### Despliegue

```powershell
az group create --name Compensar_Corp_Azure_Trv_I --location "eastus"
az group create --name rg-platfr-secuty-privte-trv-i --location "eastus"
az group create --name rg-platfr-secuty-public-trv-i --location "eastus"

az deployment group create --resource-group rg-platfr-secuty-public-trv-i --template-file PublicResources.bicep --parameters '@parameters\public.parameters.json' --parameters '@../Globals/tags.parameters.json'
az deployment group create --resource-group rg-platfr-secuty-privte-trv-i --template-file PrivateResources.bicep --parameters '@parameters\private.parameters.json' --parameters '@../Globals/tags.parameters.json'
```

### Limpieza

```powershell
az group remove --name Compensar_Corp_Azure_Trv_I
az group remove --name rg-platfr-secuty-privte-trv-i
az group remove --name rg-platfr-secuty-public-trv-i
```