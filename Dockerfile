FROM openjdk:8
MAINTAINER Jussi Lindfors

ENV HEAT_ROOT=/opt/heatledger
ENV HEAT_VERSION="1.0.3"
ENV HEAT_VERSION_ZIP="${HEAT_VERSION}.a"

RUN cd /tmp \
  && wget -q -P /tmp https://github.com/Heat-Ledger-Ltd/heatledger/releases/download/v${HEAT_VERSION}/heatledger-${HEAT_VERSION_ZIP}.zip \
  && unzip heatledger-${HEAT_VERSION_ZIP}.zip \
  && mv heatledger-${HEAT_VERSION_ZIP} ${HEAT_ROOT} \
  && rm -rf /tmp/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 7733 7734 7744 7755

CMD ["/run.sh"]