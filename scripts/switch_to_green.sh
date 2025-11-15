#!/bin/bash
set -e
echo "🔁 Cambiando tráfico hacia GREEN..."
sed -i '' 's/backend-blue:4000/backend-green:4000/' nginx/blue-green.conf
sed -i '' 's/frontend-blue:80/frontend-green:80/' nginx/blue-green.conf
docker exec nginx nginx -s reload || docker restart nginx
echo "✅ Tráfico cambiado a GREEN."
