set -euxo pipefail

source ../.env

sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$SQL_SA_PASWORD" -p 1433:"$SQL_PORT" --name "$SQL_IMAGE_NAME" -h "$SQL_SERVER_NAME" -d mcr.microsoft.com/mssql/server:2017-latest


set +euxo pipefail