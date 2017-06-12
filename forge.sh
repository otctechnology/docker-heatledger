#!/bin/bash

apiServerPort_var="${SERVER_PROPERTY_PREFIX}apiServerPort"

if [ -z "${1}" ]; then
  echo "First arg needs to be secret phrase"
  exit 1
fi

api_key=${2}
if [ -z "${2}" ]; then
  if [ -z "${heat__apiKey}" ]; then
    echo "API Key is not setU! Use second argument as API key or set enironment variable named heat__apiKey"
    exit 1
  fi
  api_key=${heat__apiKey}
fi


url="http://localhost:${!apiServerPort_var:-7733}/api/v1/mining/start/${1// /%20}?api_key=${api_key}"
if curl -X POST "${url}" -s | grep -q deadline ; then
  echo "Forging started"
  exit 0
fi
echo "Forging failed"
exit 1