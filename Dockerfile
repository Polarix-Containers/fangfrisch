ARG UID=200025
ARG GID=200025
ARG PYTHON=3.14
ARG INTERVAL=10m
ARG INITIALIZED=false

FROM python:${PYTHON}-alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

ARG UID
ARG GID

ENV INTERVAL=${INTERVAL}
ENV INITIALIZED=${INITIALIZED}

RUN apk -U upgrade \
  && apk add libstdc++

RUN --network=none \
    addgroup -g ${GID} fangfrisch \
    && adduser -u ${UID} --ingroup fangfrisch --disabled-password --system fangfrisch --home /app \
    && mkdir -p /var/lib/fangfrisch /var/lib/clamav \
    && chown -R fangfrisch:fangfrisch /var/lib/fangfrisch /var/lib/clamav

WORKDIR /app

USER fangfrisch

RUN pip3 install fangfrisch

COPY fangfrisch.conf /etc/fangfrisch.conf
COPY --chmod=755 entrypoint.sh /entrypoint.sh

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/
ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"

VOLUME /var/lib/fangfrisch /var/lib/clamav

ENTRYPOINT [ "/entrypoint.sh" ]
