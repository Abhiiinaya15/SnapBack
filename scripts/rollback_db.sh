
#!/usr/bin/env bash
set -euo pipefail
# Optional: create/upgrade first so rollback shows clearly in logs
python3 scripts/db_migrate.py upgrade || true
# Now perform rollback (downgrade)
python3 scripts/db_migrate.py downgrade
