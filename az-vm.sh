az group create \
--name AZ \
--location eastus

az network nsg create \
--resource-group AZ \
--name AZ-NSG

az network nsg rule create \
--resource-group AZ \
--nsg-name AZ-NSG --name AZ_Nsg_Rule --priority 100 \
--source-address-prefixes '*' --source-port-ranges '*' \
--destination-address-prefixes '*' --destination-port-ranges '*' \
--access Allow --protocol Tcp --description "Allowing ALL"

for i in `seq 1 `; do
   az vm create \
     --resource-group AZ \
     --name Master$i \
     --size Standard_B1s  \
     --storage-sku StandardSSD_LRS \
     --public-ip-address-allocation dynamic \
     --os-disk-size-gb 32 \
     --vnet-name Vnet \
     --subnet Subnet \
     --nsg AZ-Nsg \
     --image Ubuntu2204 \
     --admin-username master \
     --admin-password "india@123456"
done

for i in `seq 1 `; do
   az vm create \
     --resource-group AZ \
     --name Node$i \
     --size Standard_B1s  \
     --storage-sku StandardSSD_LRS \
     --public-ip-address-allocation dynamic \
     --os-disk-size-gb 32 \
     --vnet-name Vnet \
     --subnet Subnet \
     --nsg AZ-Nsg \
     --image Ubuntu2204 \
     --admin-username node \
     --admin-password "india@123456"
done
