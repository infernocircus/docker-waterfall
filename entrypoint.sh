#!/bin/sh

# Basado en https://github.com/itzg/docker-minecraft-server

set -e

# Remove old mods/plugins
if [ "$REMOVE_OLD_MODS" = "TRUE" ]; then
  rm -rf ./plugins
fi

# If supplied with a URL for a modpack (simple zip of jars), download it and unpack
if [[ "$MODPACK" ]]; then
  if ! wget -O /tmp/modpack.zip "$MODPACK"; then
    log "ERROR: failed to download the modpack from $MODPACK"
    exit 2
  fi
  mkdir -p ./plugins
  if ! unzip -o -d ./plugins /tmp/modpack.zip; then
    log "ERROR: failed to unzip the modpack from $MODPACK"
    exit 2
  fi
  rm -f /tmp/modpack.zip
fi

if [[ "$SERVERCONFIG" ]]; then
  yes | cp -rf $SERVERCONFIG/* .
fi

if [[ "$1" ]]; then
  eval $1
else
  java -jar waterfall.jar
fi
