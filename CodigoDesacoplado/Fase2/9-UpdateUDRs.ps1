param (
    [string]$TenantId = "",
    [string]$ExcludedSubscriptionId = "e23d8cf5-3d42-4a5b-8de9-3c007188e17e"
)

# Inicia sesión en Azure con el tenant especificado
Connect-AzAccount -TenantId $TenantId

# Obtiene todas las suscripciones, excluyendo la indicada
$subscriptions = Get-AzSubscription | Where-Object { $_.Id -ne $ExcludedSubscriptionId }

# Archivo de salida
$outputFile = "UDR-Actualizacion.txt"
Out-File -FilePath $outputFile -Force

foreach ($subscription in $subscriptions) {
    Write-Host "Procesando suscripción: $($subscription.Name)" -ForegroundColor Cyan
    Add-Content -Path $outputFile -Value "Suscripción: $($subscription.Name) [$($subscription.Id)]"

    # Cambia el contexto a la suscripción actual
    Set-AzContext -SubscriptionId $subscription.Id

    # Obtiene todas las tablas de rutas (UDRs)
    $routeTables = Get-AzRouteTable

    foreach ($routeTable in $routeTables) {
        $resourceGroup = $routeTable.ResourceGroupName
        $tableName = $routeTable.Name
        $location = $routeTable.Location
        $routes = $routeTable.Routes

        $updated = $false

        # Crear una copia de las rutas para evitar modificar la colección durante la iteración
        $routesCopy = @($routes)

        foreach ($route in $routesCopy) {
            if ($route.NextHopIpAddress -eq "10.200.60.68") {
                $log = "Actualizando ruta '$($route.Name)' en tabla '$tableName' del grupo de recursos '$resourceGroup'"
                Write-Host $log -ForegroundColor Yellow
                Add-Content -Path $outputFile -Value $log

                # Eliminar la ruta antigua
                Remove-AzRouteConfig -Name $route.Name -RouteTable $routeTable | Out-Null

                # Agregar la ruta actualizada
                Add-AzRouteConfig -Name $route.Name `
                                  -AddressPrefix $route.AddressPrefix `
                                  -NextHopType $route.NextHopType `
                                  -NextHopIpAddress "10.204.1.132" `
                                  -RouteTable $routeTable | Out-Null

                $updated = $true
            }
        }

        if ($updated) {
            # Aplicar los cambios a la tabla de rutas
            Set-AzRouteTable -RouteTable $routeTable | Out-Null

            $confirmation = "Tabla de rutas '$tableName' actualizada."
            Write-Host $confirmation -ForegroundColor Green
            Add-Content -Path $outputFile -Value $confirmation
        }
    }
}

Write-Host "Actualización de UDRs completada en todas las suscripciones del tenant $TenantId (excepto la excluida)." -ForegroundColor Green
Add-Content -Path $outputFile -Value "Actualización completada en todas las suscripciones del tenant $TenantId."
