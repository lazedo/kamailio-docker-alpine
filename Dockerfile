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
COPY --from=build /home/kamailio/packages/kamailio/x86_64/kamailio* /apk/
RUN echo "/apks" >> etc/apk/repositories \
    && apk update \
    && apk add kamailio kamailio-presence kamailio-kazoo kamailio-db_kazoo \
               kamailio-extras kamailio-outbound kamailio-websocket \
               kamailio-tls kamailio-utils kamailio-uuid --allow-untrusted 
#    && rm kamailio*

ENTRYPOINT ["kamailio", "-DD", "-E"]
