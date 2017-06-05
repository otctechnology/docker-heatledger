# Heatledger Cryptocurrency Server

HEAT Java server container. See releases at: https://github.com/Heat-Ledger-Ltd/heatledger

> *HEAT is a cryptocurrency that works in peer-to-peer client-server configuration. By running the HEAT Java server node on your workstation or server you enhance the security of your own cryptocurrency operations, and participate in keeping up the HEAT decentralized network. By enabling forging in your HEAT wallet running on top of your own HEATnode, you are eligible for (Proof-of-Stake) rewards and blockchain file storage (Proof-of-Presence) rewards granted in average every 25 seconds to a random participant of the network.* - http://heatledger.com/

## Building image

Check docker hub releases for exact image versions: https://hub.docker.com/r/jussil/heatledger/

  - [Install Docker](https://docs.docker.com/engine/installation/)
  - Run in the repository dir `docker build -t heatledger .`

## Usage

  - [Install Docker](https://docs.docker.com/engine/installation/)
  - Pull the image: `docker pull jussil/heatledger` (or some other image tags)
  - Run the container detached:
  ```
docker run -d --name heatledger \
  -p 7733:7733 \
  -p 7744:7744 \
  -e "heat__apiKey=<HEATWALLET ACCOUNT ID (numeric)>" \
  -e "heat__myAddress=<PUBLIC IP/HOST OF SERVER>" \
  -e "heat__myHallmark=<HALLMARK GENERATED FROM https://heatwallet.com/api/#!/Tools/encode>" \
  jussil/heatledger
```

## Configuration

All passed environment variables that starts with heat__ will be used as config. First we transform `__` characters into `.` to match properties config style and then replace provided config values from base properties file.

You should check default configurations from running container under `/opt/heatledger/conf/heat-default.properties`

## Notes

- Install guide of HEAT Server that were used to do this image
  - http://heatnodes.org/heatnodes.pdf

## Author
Jussi Lindfors