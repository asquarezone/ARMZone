param region string = 'eastus'
param vnetCidr string = '10.0.0.0/16'
param subnetCidrs array = [ '10.0.0.0/24', '10.0.1.0/24', '10.0.2.0/24' ]
param subnetNames array = [ 'web', 'app', 'db' ]
var arch_name = 'ntier'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: arch_name
  location: region
  properties: {
    addressSpace: {
      addressPrefixes: [ vnetCidr ]
    }
  }
}

@batchSize(1)
resource subnets 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = [for index in range(0, length(subnetCidrs)): {
  name: subnetNames[index]
  parent: virtualNetwork
  properties: {
    addressPrefix: subnetCidrs[index]
  }
}]
