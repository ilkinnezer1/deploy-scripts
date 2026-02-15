#!/bin/bash

docker run -d \
    -p 25565:25565 \
    --name mc-server \
    -e VERSION=1.20.6 \
    -e TYPE=PAPER \
    -e EULA=TRUE \
    -e DIFFICULTY=normal \
    -e MAX_PLAYERS=5 \
    -e MAX_MEMORY=2G \
    -e JVM_OPTS="-Xms2G -Xmx2G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=8M" \
    -e ENABLE_RCON=true \
    -e RCON_PASSWORD="farhad123" \
    -v /var/docker/mc-data:/data \
    itzg/minecraft-server:java21-alpine
