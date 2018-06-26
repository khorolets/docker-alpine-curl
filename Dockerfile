FROM alpine:3.7

RUN apk add --no-cache --virtual=.build_dependencies wget && \
    wget https://releases.rancher.com/cli/v0.6.4/rancher-linux-amd64-v0.6.4.tar.gz && \
    tar -xf rancher-linux-amd64-v0.6.4.tar.gz &&  \
    cp rancher-v0.6.4/rancher /usr/bin/rancher && \
    chmod a+x /usr/bin/rancher && \
    rm rancher-linux-amd64-v0.6.4.tar.gz && \
    rm -rf rancher-v0.6.4 && \
    apk del .build_dependencies && \
    apk add --no-cache curl

ENTRYPOINT ["/usr/bin/rancher"]
