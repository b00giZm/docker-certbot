FROM ubuntu:16.04
MAINTAINER Pascal Cremer "b00gizm@gmail.com"

RUN apt-get update \
    && echo "APT::Get::Assume-Yes \"true\";" >> /etc/apt/apt.conf \
    && echo "APT::Get::force-yes \"true\";" >> /etc/apt/apt.conf \
    && apt-get upgrade \
    && apt-get install \
        dialog \
        wget \
    && mkdir /app \
    && wget -P /app https://dl.eff.org/certbot-auto \
    && chmod +x /app/certbot-auto \
    && /app/certbot-auto --os-packages-only \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /app

CMD ["./certbot"]
