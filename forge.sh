#!/bin/bash

if [ -z "${1}" ]; then
  echo "First arg needs to be secret phrase"
  exit 1
fi

if [ -z "${heat__apiKey}" ]; then
  echo "API Key is not set in environment variable named: heat__apiKey!"
  exit 1
fi

# Use environment provided port or fallback to default one
api_port="${heat__apiServerPort:-7733}"

echo "Expect JSON response below to be like: {\"deadline\"..."
wget -qO- "http://localhost:${api_port}/api/v1/mining/start/${1// /%20}?api_key=${heat__apiKey}"