d# ARM Template

## Understanding

1. Create a json file
2. Add mandatory sections ($schema, contentVersion, resources)
3. contentVersion is your version of template
4. resource: any thing which you want to create
    a. type   => properties
    b. apiversion
    c. name
5. depends on => dependency

A
  depends on C

C
   depends on B

B
  

Special functions (special syntaxes)


re usablility
  => parameters & variables


## Execution

1. CLI
   az group deployment create
2. PORTAL

3. POWERSHELL
    New-AzureRmResourceGroupDeployment

