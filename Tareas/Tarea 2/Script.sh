#!/bin/bash
GITHUB_USER="LuisRivera2016"
API_URL="https://api.github.com/users/$GITHUB_USER"
RESPONSE=$(curl -s $API_URL)
GITHUB_ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')
MESSAGE="Hola $GITHUB_USER. User ID: $GITHUB_ID. Cuenta fue creada el: $CREATED_AT."
CURRENT_DATE=$(date +"%Y%m%d")
LOG_DIR="/tmp/$CURRENT_DATE"
mkdir -p $LOG_DIR
LOG_FILE="$LOG_DIR/saludos.log"
echo $MESSAGE > $LOG_FILE
echo $MESSAGE
CRON_EXPRESSION="*/5 * * * *"
(crontab -l ; echo "$CRON_EXPRESSION $PWD/tu_script.sh") | crontab -