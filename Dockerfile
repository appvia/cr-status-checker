FROM alpine/curl:3.14

LABEL maintainer "info@appvia.io"
LABEL source "https://github.com/appvia/cr-status-checker"

ENV API_SERVER=https://kubernetes.default.svc
ENV TOKEN=/var/run/secrets/kubernetes.io/serviceaccount/token
ENV CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

WORKDIR /script

RUN apk add --no-cache jq

RUN addgroup -S crsc && \
    adduser -S crsc -G crsc && \
    chown -R crsc:crsc /script

COPY crsc.sh /script/crsc.sh

USER crsc

ENTRYPOINT ["/script/crsc.sh"]
