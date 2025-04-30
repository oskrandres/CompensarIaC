#Despliegue

az group create --name rg-hub-compensar --location "Central US"
az deployment group create --resource-group rg-hub-compensar --template-file "main.bicep" --parameters "@parameters/project.parameters.json" --parameters "@parameters/afw.parameters.json" --parameters "@parameters/ipgroups.parameters.json" --parameters "@parameters/afwpcr.parameters.json" --what-if