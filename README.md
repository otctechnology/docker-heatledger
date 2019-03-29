# OTC  Server

OTC Java server container. See releases at: https://github.com/Heat-Ledger-Ltd/heatledger

> *HEAT is a cryptocurrency that works in peer-to-peer client-server configuration. By running the HEAT Java server node on your workstation or server you enhance the security of your own cryptocurrency operations, and participate in keeping up the HEAT decentralized network. By enabling forging in your HEAT wallet running on top of your own HEATnode, you are eligible for (Proof-of-Stake) rewards and blockchain file storage (Proof-of-Presence) rewards granted in average every 25 seconds to a random participant of the network.* - http://heatledger.com/

## Requirements

  - [Install Docker](https://docs.docker.com/engine/installation/)

## Quickstart

```
# Create hallmark
docker run --rm jussil/heatledger /hallmark.sh "dog cat sheep .." 911.911.911.911

# Run server
docker run -d --name heatledger \
  -p 7733:7733 \
  -p 7744:7744 \
  -e "heat__maxNumberOfConnectedPublicPeers=500" \
  -e "heat__myPlatform=abc123" \
  -e "heat__apiKey=abc123" \
  -e "heat__myAddress=911.911.911.911" \
  -e "heat__myHallmark=ASDF123" \
  jussil/heatledger

# Check block height
docker logs heatledger

# Start forging when on full height
docker exec heatledger /forge.sh "your secret passphrase"
```

## Usage

### Building image

Check docker hub releases for exact image versions: https://hub.docker.com/r/jussil/heatledger/

  - Run in the repository dir `docker build -t jussil/heatledger .`

### Creating hallmark

In order to participate in lottery you need hallmark. To create it, run the container script `/hallmark.sh "<wallet secret phrase>" <PUBLIC IP/HOST>`, ie:
```
# If server is not running
docker run --rm jussil/heatledger /hallmark.sh "dog cat sheep .." 911.911.911.911
# If server is running
docker exec heatledger /hallmark.sh "dog cat sheep .." 911.911.911.911
```

This will run the server inside the container and do the API request locally to acquire hallmark.

### Run server
  - Run the container detached:
```
docker run -d --name heatledger \
  -p 7733:7733 \
  -p 7744:7744 \
  -e "heat__maxNumberOfConnectedPublicPeers=500" \
  -e "heat__myPlatform=<HEATWALLET ACCOUNT ID (numeric)>" \
  -e "heat__apiKey=<HEATWALLET ACCOUNT ID (numeric)>" \
  -e "heat__myAddress=<PUBLIC IP/HOST OF SERVER>" \
  -e "heat__myHallmark=<HALLMARK GENERATED SCRIPT OR FROM https://heatwallet.com/api/#!/Tools/encode>" \
  jussil/heatledger
```

### Forging

In order to start forging after server is in sync, you need to do an API request to your server with your secret phrase.

You can do this by executing script inside of running server container like this (assuming you named your container `heatledger`:
```
docker exec heatledger /forge.sh "your secret passphrase"
```

## Configuration

All passed environment variables that starts with heat__ will be used as config. First we transform `__` characters into `.` to match properties config style and then replace provided config values from base properties file.

You should check default configurations from running container under `/opt/heatledger/conf/heat-default.properties`

## Notes

- Install guide of HEAT Server that were used to do this image
  - http://heatnodes.org/heatnodes.pdf

## Author
Jussi Lindfors
