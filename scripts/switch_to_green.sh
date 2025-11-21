#!/bin/bash
CONF_FILE="./nginx/blue-green.conf"

if [ ! -f "$CONF_FILE" ]; then
  echo " No se encontró $CONF_FILE, creando archivo temporal..."
  mkdir -p ./nginx
  cat > $CONF_FILE <<EOL
upstream backend_active {
    server huitzilin-backend-blue:4000;
}

server {
    listen 80;
    location / {
        proxy_pass http://backend_active;
    }
}
EOL
fi

echo " Cambiando tráfico hacia GREEN..."
sed -i 's/huitzilin-backend-blue:4000/huitzilin-backend-green:4000/' "$CONF_FILE"
sed -i 's/huitzilin-frontend-blue:80/huitzilin-frontend-green:80/' "$CONF_FILE"
echo " Tráfico cambiado a GREEN en $CONF_FILE"

