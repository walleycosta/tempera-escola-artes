# Script de Deploy no Azure para Escola de Artes

Write-Host "Iniciando processo de deployment..." -ForegroundColor Green

# 1. Verificar e instalar Azure CLI se necessário
Write-Host "`n1. Verificando Azure CLI..." -ForegroundColor Yellow
if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    Write-Host "Azure CLI não encontrado. Instalando..." -ForegroundColor Yellow
    
    # Tentar instalar via MSI
    $url = "https://aka.ms/installazurecliwindows"
    $installerPath = "$env:TEMP\AzureCLI.msi"
    
    Write-Host "Baixando Azure CLI..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $installerPath -UseBasicParsing
    
    Write-Host "Instalando Azure CLI (isso pode levar alguns minutos)..." -ForegroundColor Cyan
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet" -Wait
    
    Write-Host "Azure CLI instalado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "Azure CLI já está instalado." -ForegroundColor Green
}

# 2. Verificar versão
Write-Host "`n2. Verificando versão do Azure CLI..." -ForegroundColor Yellow
az --version

# 3. Fazer login
Write-Host "`n3. Fazendo login no Azure..." -ForegroundColor Yellow
Write-Host "Uma janela do navegador será aberta para autenticação." -ForegroundColor Cyan
az login

# 4. Definir variáveis
$resourceGroup = "rg-escola-artes"
$appServicePlan = "plan-escola-artes"
$webAppName = "webapp-escola-artes-$(Get-Random -Minimum 1000 -Maximum 9999)"
$location = "brazilsouth"
$projectPath = "C:\Users\walle\OneDrive\Documentos\Escola de Artes"

Write-Host "`n4. Criando grupo de recursos..." -ForegroundColor Yellow
az group create --name $resourceGroup --location $location

Write-Host "`n5. Criando plano do App Service..." -ForegroundColor Yellow
az appservice plan create `
  --name $appServicePlan `
  --resource-group $resourceGroup `
  --sku F1 `
  --is-linux

Write-Host "`n6. Criando Web App..." -ForegroundColor Yellow
az webapp create `
  --resource-group $resourceGroup `
  --plan $appServicePlan `
  --name $webAppName `
  --runtime "html|1.0"

Write-Host "`n7. Preparando arquivo para deployment..." -ForegroundColor Yellow
$zipPath = "$env:TEMP\site-artes.zip"
if (Test-Path $zipPath) { Remove-Item $zipPath }
Compress-Archive -Path "$projectPath\*" -DestinationPath $zipPath -Force

Write-Host "`n8. Fazendo deploy do site..." -ForegroundColor Yellow
az webapp deployment source config-zip `
  --resource-group $resourceGroup `
  --name $webAppName `
  --src $zipPath

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "DEPLOYMENT CONCLUÍDO COM SUCESSO!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "`nSeu site está disponível em:" -ForegroundColor Cyan
Write-Host "https://$webAppName.azurewebsites.net" -ForegroundColor Yellow
Write-Host "`nInformações do Grupo de Recursos: $resourceGroup" -ForegroundColor Cyan
Write-Host "Plano: $appServicePlan" -ForegroundColor Cyan
Write-Host "`n========================================`n" -ForegroundColor Green
