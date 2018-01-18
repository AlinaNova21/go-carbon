FROM alpine
ENV GO_CARBON_VERSION=0.11.0
RUN apk add --no-cache wget \
&& wget -O /usr/bin/go-carbon https://github.com/lomik/go-carbon/releases/download/v$GO_CARBON_VERSION/go-carbon-linux-amd64 --no-check-certificate \
&& chmod +x /usr/bin/go-carbon

RUN useradd carbon

ADD *.conf /etc/go-carbon/

CMD ["/usr/bin/go-carbon", "-config", "/etc/go-carbon/go-carbon.conf"]