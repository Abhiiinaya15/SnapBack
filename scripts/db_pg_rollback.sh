#!/usr/bin/env bash
set -euo pipefail
psql -v ON_ERROR_STOP=1 -f db/migrations/001_drop_demo_log.sql
echo "[rollback] demo_log dropped"
