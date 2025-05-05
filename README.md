# Introducción

Este proyecto ayuda en la automatización de la infraestructura utilizada por Compensar.

## Arquitectura actual de referencia

![Arquitectura](Docs/Actual.png)

### Pre Requesitos

Azure CLI
Bicep

### Despliegue

```powershell
az group create --name rg-hub-compensar --location "Central US"

az deployment group create --resource-group rg-hub-compensar --template-file "main.bicep" --parameters "@parameters/project.parameters.json" --parameters "@parameters/afw.parameters.json" --parameters "@parameters/ipgroups.parameters.json" --parameters "@parameters/afwpcr.parameters.json" --parameters "@parameters/vnet.parameters.json" --what-if
```