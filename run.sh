#!/bin/bash

# Create properties config file from env variables
server_properties_file=${SERVER_ROOT}/conf/${SERVER_PROPERTY_FILE}
# Go through all env variables starting with SERVER_PROPERTY_PREFIX.
variables=( $(compgen -A variable | grep ${SERVER_PROPERTY_PREFIX}) )
for var_name in "${variables[@]}"
do
  # Replace __ with . in variable name to match properties config style
  config_name=${var_name//__/.}
  config_value=${!var_name}
  # Add config to properties file
  echo "$config_name=$config_value" >> ${server_properties_file}
done

# Hacky and dirty fix for clean storage, heat requires server to run again when there is no existing block info :()
${SERVER_BIN}
exec ${SERVER_BIN}