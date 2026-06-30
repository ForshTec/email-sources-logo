#!/usr/bin/env bash
# Regenerates index.json from the logos/ directory.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LOGOS="$ROOT/logos"
INDEX="$ROOT/index.json"

python3 - <<PYEOF
import os, json
logos = sorted(f.replace('.svg', '') for f in os.listdir('$LOGOS') if f.endswith('.svg'))
with open('$INDEX', 'w') as f:
    json.dump({'domains': logos, 'count': len(logos)}, f, indent=2)
    f.write('\n')
print(f"index.json updated: {len(logos)} domains")
PYEOF
