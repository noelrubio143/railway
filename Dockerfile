FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates \
 && curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && unzip -j /tmp/x.zip xray -d /usr/local/bin \
 && chmod +x /usr/local/bin/xray \
 && rm /tmp/x.zip \
 && apk del unzip
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
