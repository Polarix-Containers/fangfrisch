ARG UID=200025
ARG GID=200025
ARG PYTHON=3.14

FROM python:${PYTHON}-alpine

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN --network=none \
    addgroup -g ${GID} fangfrish \
    && adduser -u ${UID} --ingroup fangfrish --disabled-password --system fangfrish --home /var/lib/fangfrisch

USER fangfrish

RUN pip3 install fangfrisch

