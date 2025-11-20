#!/bin/bash
ACTIVE=$(docker ps --format '{{.Names}}' | grep -o 'backend-blue\|backend-green' | head -n1 | cut -d'-' -f2 | tr '[:lower:]' '[:upper:]')
echo "${ACTIVE:-BLUE}"

