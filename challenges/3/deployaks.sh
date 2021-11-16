source ../.env

az aks create --resource-group teamresources --name myAKSCluster --node-count 3 --enable-addons monitoring --generate-ssh-keys
az aks update -n myAKSCluster -g teamresources --attach-acr $ACR_NAME