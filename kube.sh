az group create --name myResourceGroup --location eastus

az aks create -g myResourceGroup -n myAKSCluster --enable-managed-identity --node-count 1 --node-vm-size Standard_B2s --enable-addons azure-keyvault-secrets-provider --enable-oidc-issuer --enable-workload-identity

az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
