# Inicia sesión en Azure
Connect-AzAccount

# Obtiene todas las suscripciones
$subscriptions = Get-AzSubscription

foreach ($subscription in $subscriptions) {
    Write-Host "Procesando suscripción: $($subscription.Name)" -ForegroundColor Cyan

    # Cambia el contexto a la suscripción actual
    Set-AzContext -SubscriptionId $subscription.Id

    # Obtiene todas las tablas de rutas (UDRs)
    $routeTables = Get-AzRouteTable

    foreach ($routeTable in $routeTables) {
        $updated = $false

        foreach ($route in $routeTable.Routes) {
            if ($route.NextHopIpAddress -eq "10.200.60.68") {
                Write-Host "Actualizando ruta '$($route.Name)' en '$($routeTable.Name)'..." -ForegroundColor Yellow
                $route.NextHopIpAddress = "10.204.1.132"
                $updated = $true
            }
        }

        # Si se actualizó alguna ruta, guarda los cambios
        if ($updated) {
            Set-AzRouteTable -ResourceGroupName $routeTable.ResourceGroupName -Name $routeTable.Name -Route $routeTable.Routes
            Write-Host "Tabla de rutas '$($routeTable.Name)' actualizada." -ForegroundColor Green
        }
    }
}

Write-Host "✅ Actualización de UDRs completada en todas las suscripciones." -ForegroundColor Green