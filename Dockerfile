FROM debian
ENV GO_CARBON_VERSION=0.11.0
RUN apt-get update && apt-get install -y wget \
&& wget -O /usr/bin/go-carbon https://github.com/lomik/go-carbon/releases/download/v$GO_CARBON_VERSION/go-carbon-linux-amd64 --no-check-certificate \
&& chmod +x /usr/bin/go-carbon

RUN addgroup -g 1000 carbon && adduser -D -u 1000 -G carbon carbon

CMD ["/usr/bin/go-carbon", "-config", "/etc/go-carbon/go-carbon.conf"]