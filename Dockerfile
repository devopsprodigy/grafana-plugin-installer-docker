FROM alpine

ENV GRAFANA_PLUGIN_DIR \
    GRAFANA_PLUGIN_REPO \
    GRAFANA_PLUGIN_TAG

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY --chown=472:472 entrypoint.sh .

WORKDIR /git

ENTRYPOINT ["/entrypoint.sh"]
