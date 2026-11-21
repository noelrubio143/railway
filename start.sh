#!/bin/sh
# Kailangan sa Railway Variables: XRAY_UUID, WS_PATH (hal. /vpn-ws)
# PORT ay ibinibigay mismo ng Railway.
: "${XRAY_UUID:?Ilagay ang XRAY_UUID sa Railway Variables}"
WS_PATH="${WS_PATH:-/vpn-ws}"
cat > /etc/xray.json <<CFG
{
  "log": {"loglevel": "warning"},
  "inbounds": [{
    "listen": "0.0.0.0",
    "port": ${PORT:-8080},
    "protocol": "vless",
    "settings": {"clients": [{"id": "${XRAY_UUID}"}], "decryption": "none"},
    "streamSettings": {"network": "ws", "wsSettings": {"path": "${WS_PATH}"}}
  }],
  "outbounds": [{"protocol": "freedom"}]
}
CFG
exec xray run -config /etc/xray.json
