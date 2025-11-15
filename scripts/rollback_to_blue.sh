#!/bin/bash
set -e
echo "⚠️  Rollback: regresando a BLUE..."
sed -i '' 's/backend-green:4000/backend-blue:4000/' nginx/blue-green.conf
sed -i '' 's/frontend-green:80/frontend-blue:80/' nginx/blue-green.conf
docker exec nginx nginx -s reload || docker restart nginx
echo "✅ Rollback completado."
