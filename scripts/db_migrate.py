
#!/usr/bin/env python3
import os, sqlite3, sys
DB_PATH = os.environ.get("DB_PATH", "db/snapback.db")

def connect():
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    return sqlite3.connect(DB_PATH)

def upgrade(conn):
    conn.execute("""
        CREATE TABLE IF NOT EXISTS demo_log (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            msg TEXT,
            created_at TEXT DEFAULT (datetime('now'))
        )
    """)
    conn.commit()
    print(f"[upgrade] demo_log created in {DB_PATH}")

def downgrade(conn):
    conn.execute("DROP TABLE IF EXISTS demo_log")
    conn.commit()
    print(f"[downgrade] demo_log dropped in {DB_PATH}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: db_migrate.py [upgrade|downgrade]")
        sys.exit(2)
    cmd = sys.argv[1]
    conn = connect()
    try:
        if cmd == "upgrade":
            upgrade(conn)
        elif cmd == "downgrade":
            downgrade(conn)
        else:
            print("Unknown command")
            sys.exit(2)
    finally:
        conn.close()
