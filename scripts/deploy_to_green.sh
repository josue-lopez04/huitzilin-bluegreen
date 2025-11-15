#!/bin/bash
set -e
echo "🚀 Desplegando en entorno GREEN..."
docker compose build backend-green frontend-green
docker compose up -d backend-green frontend-green
echo "✅ Green desplegado y corriendo en puertos 5000 y 8081"
