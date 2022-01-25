FROM alpine/curl:3.14

RUN apk add --no-cache jq

ENV API_SERVER=https://kubernetes.default.svc
ENV TOKEN=/var/run/secrets/kubernetes.io/serviceaccount/token
ENV CA_CERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
