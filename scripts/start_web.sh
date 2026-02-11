#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-6008}"
echo "[start_web] starting web on port ${PORT}"
PORT="${PORT}" npm run dev
