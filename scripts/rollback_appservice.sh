#!/bin/bash
RESOURCE_GROUP=$1
APP_NAME=$2
SOURCE_SLOT=$3
TARGET_SLOT=$4
echo "Swapping slots for App Service: $APP_NAME"
az webapp deployment slot swap -g $RESOURCE_GROUP -n $APP_NAME --source-slot $SOURCE_SLOT --target-slot $TARGET_SLOT

