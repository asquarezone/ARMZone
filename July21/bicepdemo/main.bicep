param vnetcidr string = '10.0.0.0/16'
param webcidr string = '10.0.0.0/24'
param appcidr string = '10.0.1.0/24'
param dbcidr string = '10.0.2.0/24'
param cidr object = {
  vnet: '10.0.0.0/16'
  subnets: [
    '10.0.0.0/24' 
    '10.0.1.0/24' 
    '10.0.1.0/24'
  ]
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'ntier'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetcidr
        //cidr.vnet
      ]
    }
    subnets: [
      {
        name: 'web'
        properties: {
          addressPrefix: webcidr //cidr.vnet.subnets[0]
        }
      }
      {
        name: 'app'
        properties: {
          addressPrefix: appcidr
        }
      }
      {
        name: 'db'
        properties: {
          addressPrefix: dbcidr
        }
      }
    ]
  }
}

