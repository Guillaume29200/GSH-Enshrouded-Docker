#!/bin/bash
echo "Starting Enshrouded..."
if [ "$GSH_GAME_UPDATE" = "true" ]; then
    /scripts/steam-update.sh
fi
/scripts/start-server.sh
