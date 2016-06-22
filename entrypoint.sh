#!/usr/bin/env bash

MMS_BASE_URL=${MMS_BASE_URL:-https://mms.mongodb.com}
CONF_DIR=/etc/mongodb-mms/monitoring-agent.config

if [ ! "$MMS_API_KEY" ]; then
    echo 'error: MMS_API_KEY variable not found in environment'
    exit 1
fi

if grep -q mmsApiKey ${CONF_DIR}; then
    echo "mmsApiKey = ${MMS_API_KEY}" >> ${CONF_DIR}
fi
if grep -q mmsBaseUrl ${CONF_DIR}; then
    echo "mmsBaseUrl = ${MMS_BASE_URL}" >> ${CONF_DIR}
fi
exec mongodb-mms-monitoring-agent -conf ${CONF_DIR} "$@"
