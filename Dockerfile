from alpine as build
ARG TOKEN
RUN    apk update \
    && apk add alpine-sdk \
    && mkdir -p /var/cache/distfiles \
    && chmod a+w /var/cache/distfiles \
    && adduser -D kamailio \
    && addgroup kamailio abuild
USER kamailio
WORKDIR /home/kamailio
ENV TOKEN=${TOKEN}
RUN    abuild-keygen -a -i \
    && git clone https://github.com/lazedo/kamailio-docker-alpine.git \
    && cd kamailio-docker-alpine \
    && abuild checksum \
    && abuild -r

from alpine as kamailio
COPY --from=build /home/kamailio/packages/kamailio/x86_64/* /apks/x86_64/
RUN echo -e "/apks\n$(cat /etc/apk/repositories)" > /etc/apk/repositories \
    && apk update --allow-untrusted \
    && apk add bash curl iproute2 \
               kamailio kamailio-db kamailio-json kamailio-presence \
               kamailio-kazoo kamailio-db_kazoo \
               kamailio-extras kamailio-outbound kamailio-websocket \
               kamailio-tls kamailio-utils kamailio-uuid --allow-untrusted

ENTRYPOINT ["kamailio", "-DD", "-E"]
