set -euxo pipefail

source ../.env

docker login "$ACR_Login_Server" -u "$ACR_Username" -p "$ACR_Password" 
docker pull "$ACR_Login_Server"/dataload:1.0
docker exec -t sql1 bash -c "/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P <Password> -Q 'CREATE DATABASE mydrivingDB'"

docker run --network bridge -e SQLFQDN=${SQL_SERVER_NAME} -e SQLUSER=SA -e SQLPASS=${SQL_SA_PASWORD} -e SQLDB=mydrivingDB ${ACR_Login_Server}/dataload:1.0


docker run --network bridge -e SQLFQDN=sql1 -e SQLUSER=SA -e SQLPASS=<Password> -e SQLDB=mydrivingDB registryylw2763.azurecr.io/dataload:1.0

set +euxo pipefail