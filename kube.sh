az group create --name myResourceGroup --location eastus

az aks create -g myResourceGroup -n myAKSCluster --enable-managed-identity --node-count 1 --node-vm-size Standard_B2s

az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
