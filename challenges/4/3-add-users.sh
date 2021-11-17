source ../.env

AKS_ID=$(az aks show \
    --resource-group "$RG" \
    --name "$ClusterName" \
    --query id -o tsv)

echo $AKS_ID

APPDEV_ID=$(az ad group create --display-name appdev --mail-nickname appdev --query objectId -o tsv)
WEBDEV_ID=$(az ad group create --display-name webdev --mail-nickname webdev --query objectId -o tsv)

az role assignment create \
  --assignee "$APPDEV_ID" \
  --role "Azure Kubernetes Service Cluster Admin Role" \
  --scope "$AKS_ID"

  az role assignment create \
  --assignee "$WEBDEV_ID" \
  --role "Azure Kubernetes Service Cluster User Role" \
  --scope "$AKS_ID"