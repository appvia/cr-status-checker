#!/usr/bin/env sh

CURRENT_STATE=$(curl -s -X GET ${API_SERVER}/${CUSTOM_RESOURCE_PATH} \
  --cacert ${CA_CERT} \
  --header "Authorization: Bearer $(cat ${TOKEN})" \
  | jq -r ${STATE_KEY})

if [ "${CURRENT_STATE}" != "${STATE_VALUE}" ]; then
  echo "ERROR: $(date +"%m-%d-%Y-%T") - ${API_SERVER}/${CUSTOM_RESOURCE_PATH} is not in ${STATE_VALUE} state."
  exit 1
fi
