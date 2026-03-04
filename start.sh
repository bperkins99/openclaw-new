#!/bin/bash
set -e
cd ~/openclaw-new
source .env

cp ~/.openclaw/openclaw.json.bak ~/.openclaw/openclaw.json

sed -i "s/TELEGRAM_TOKEN_PLACEHOLDER/${TELEGRAM_BOT_TOKEN}/" ~/.openclaw/openclaw.json
sed -i "s/GATEWAY_TOKEN_PLACEHOLDER/${OPENCLAW_GATEWAY_TOKEN}/" ~/.openclaw/openclaw.json
sed -i "s/JARVIS_GMAIL_ADDRESS_PLACEHOLDER/${JARVIS_GMAIL_ADDRESS}/g" ~/.openclaw/openclaw.json
sed -i "s/JARVIS_GMAIL_PASSWORD_PLACEHOLDER/${JARVIS_GMAIL_PASSWORD}/g" ~/.openclaw/openclaw.json

docker compose up -d
docker compose restart openclaw-gateway
echo "Jarvis is up."
