#!/bin/bash
# Create shared Traefik network for routing to all tenant containers
docker network create traefik-public --driver bridge --subnet 172.25.0.0/16 2>/dev/null || echo "Network traefik-public already exists"

