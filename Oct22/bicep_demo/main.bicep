param region string = 'eastus'
param vnetCidr string = '10.0.0.0/16'
param subnetCidrs array = ['10.0.0.0/24', '10.0.1.0/24', '10.0.2.0/24']
var arch_name = 'ntier'



resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: arch_name
  location: region
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetCidr
      ]
    }
    subnets: [
      {
        name: 'web'
        properties: {
          addressPrefix: subnetCidrs[0]
        }
      }
      {
        name: 'app'
        properties: {
          addressPrefix: subnetCidrs[1]
        }
      }
      {
        name: 'db'
        properties: {
          addressPrefix: subnetCidrs[2]
        }
      }
    ]
  }
}

