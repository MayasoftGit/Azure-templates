resource aks 'Microsoft.ContainerService/managedClusters@2022-11-01' = {
  name: 'myAKSCluster'
  location: 'East US'
  properties: {
    kubernetesVersion: '1.26.3'
    dnsPrefix: 'myaks'
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: 3
        vmSize: 'Standard_DS2_v2'
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: 'azureuser'
      ssh: {
        publicKeys: [
          {
            keyData: 'ssh-rsa AAAAB3...example-key'
          }
        ]
      }
    }
    networkProfile: {
      networkPlugin: 'azure'
    }
  }
}
