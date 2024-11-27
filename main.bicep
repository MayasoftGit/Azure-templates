resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'devopsstorage${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'appServicePlan'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'webApp'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
