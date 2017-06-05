#!/bin/bash

# Create heat.properties config file from env variable
heat_properties_file=${HEAT_ROOT}/conf/heat.properties

# Copy default properties file as base
cp ${HEAT_ROOT}/conf/heat-default.properties ${heat_properties_file}

# Go through all env variables starting with heat__.
variables=( $(compgen -A variable | grep heat__) )
for var_name in "${variables[@]}"
do
  # Replace __ with . in variable name to match properties config style
  config_name=${var_name//__/.}
  config_value=${!var_name}
  # Replace base properties file values with ours
  sed -i.bak "s#$config_name=.*#$config_name=$config_value#" ${heat_properties_file}
done

exec /opt/heatledger/bin/heatledger