source ../.env
#az aks enable-addons --addons azure-keyvault-secrets-provider --name "$ClusterName" --resource-group "$RG"

az keyvault create -n "$KVName" -g $RG -l westus
az keyvault secret set --vault-name "$KVName" -n SQL-SERVER --value "$SQL_Server"
az keyvault secret set --vault-name "$KVName" -n SQL-USER --value "$SQL_Server_Username"
az keyvault secret set --vault-name "$KVName" -n SQL-PASSWORD --value "$SQL_Server_Password"
az keyvault secret set --vault-name "$KVName" -n SQL-DBNAME --value "$DATABASE_NAME"


