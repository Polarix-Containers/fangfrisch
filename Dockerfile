ARG UID=200025
ARG GID=200025
ARG PYTHON=3.14
ARG INTERVAL=10m
ARG INITIALIZED=False

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
    && adduser -u ${UID} --ingroup fangfrisch --disabled-password --system fangfrish --home /var/lib/fangfrisch \
    && mkdir -p /app \
    && chown -R fangfrisch:fangfrisch /app

WORKDIR /app

USER fangfrisch

RUN pip3 install fangfrisch

COPY fangfrisch.conf /etc/fangfrisch.conf
COPY entrypoint.sh /entrypoint.sh

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/
ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"

ENTRYPOINT [ "/entrypoint.sh" ]