#!/bin/bash

echo "Unleashing the Indiscriminate Sealing Swarm Formation..."

echo "🔎 Scounting domain for container gateways..."
TARGET_LIST=$(podman ps --format "{{.Ports}}" | tr ',' '\n' | grep '[->]')

if [ -z "$TARGET_LIST" ]; then
    echo "No active gateways found. The swarm returns to the nest."
    exit 0
fi

echo "Targets acquired. Commencing sealing operation..."

SEAL_COUNT=0
while IFS= read -r line; do
    SEAL_TARGET=$(echo "$line" | sed -E 's/.*:([0-9]+)->.+\/([a-z]+).*/\1\/\2/')

    if [ -n "$SEAL_TARGET" ]; then
        echo "🔒 Issuing sealing edict for: $SEAL_TARGET"
        sudo firewall-cmd --permanent --remove-port="$SEAL_TARGET"
        ((SEAL_COUNT++))
    fi
done <<< "$TARGET_LIST"

if [ "$SEAL_COUNT" -gt 0 ]; then
    echo "Activation all the inscription in the great firewall formation..."
    sudo firewall-cmd --reload
    echo "✅ Formation complete. $SEAL_COUNT gateways have been sealed."
else
    echo "No valid gateways were found to seal."
fi
echo $TARGET_LIST