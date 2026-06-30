#!/usr/bin/env bash
# Usage: ./scripts/add-logo.sh <domain> <simple-icons-slug> [hex-color]
# Example: ./scripts/add-logo.sh klaviyo.com klaviyo 231F20
set -euo pipefail

DOMAIN="${1:?Usage: $0 <domain> <simple-icons-slug> [hex-color]}"
SLUG="${2:?Usage: $0 <domain> <simple-icons-slug> [hex-color]}"
HEX="${3:-}"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/logos/${DOMAIN}.svg"

# Download from jsDelivr (Simple Icons npm package)
URL="https://cdn.jsdelivr.net/npm/simple-icons/icons/${SLUG}.svg"
echo "Downloading $URL ..."
curl -fsSL --connect-timeout 10 "$URL" -o "$OUT"

if [[ -n "$HEX" ]]; then
  # Inject fill color if provided
  TMP="$(mktemp).svg"
  sed "s/<svg /<svg fill=\"#${HEX}\" /" "$OUT" > "$TMP"
  mv "$TMP" "$OUT"
  echo "Applied fill #$HEX"
fi

echo "Saved: $OUT"

# Regenerate index.json
"$ROOT/scripts/update-index.sh"
