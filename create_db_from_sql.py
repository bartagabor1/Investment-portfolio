import sqlite3
import os

# Target DB path
db_path = os.path.abspath("investments.db")

# Relative paths to the SQL files
sql_files = [
    "tables/clients.sql",
    "tables/portfolios.sql",
    "tables/investments.sql",
    "tables/transactions.sql",
    "tables/returns.sql",
    "tables/client_portfolios.sql",
    "tables/portfolio_investments.sql"
]

# Create the database and load the SQL scripts
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

for sql_file in sql_files:
    with open(sql_file, "r", encoding="utf-8") as f:
        sql_script = f.read()
        cursor.executescript(sql_script)

conn.commit()
conn.close()

print("✔ investments.db created and loaded from .sql files.")
