from pathlib import Path
import nbformat as nbf

# Define SQL file paths and corresponding titles
queries = [
    {
        "title": "📊 Weighted Portfolio Returns",
        "sql_file": "scripts/queries/portfolio_analysis/portfolio_weighted_return.sql",
        "visualize": True,
        "viz_code": """
import matplotlib.pyplot as plt

plt.figure(figsize=(10,6))
plt.bar(df["portfolio_name"], df["weighted_return"], color='skyblue')
plt.xticks(rotation=45, ha='right')
plt.ylabel("Weighted Return (%)")
plt.title("Portfolio Weighted Returns")
plt.tight_layout()
plt.show()
"""
    },
    {
        "title": "📈 Portfolio vs Market Benchmark",
        "sql_file": "scripts/queries/advanced/portfolio_vs_market_benchmark.sql",
        "visualize": True,
        "viz_code": """
plt.figure(figsize=(10,6))
plt.bar(df["portfolio_name"], df["difference"], color='coral')
plt.xticks(rotation=45, ha='right')
plt.ylabel("Performance Difference (%)")
plt.title("Portfolio vs Market Benchmark")
plt.tight_layout()
plt.show()
"""
    },
    {
        "title": "🏅 Rank Clients by Portfolio Value",
        "sql_file": "scripts/queries/advanced/client_rank_by_ownership.sql",
        "visualize": False
    },
    {
        "title": "🔁 Last 3 Transactions per Investment",
        "sql_file": "scripts/queries/advanced/last3_transactions_per_investment.sql",
        "visualize": False
    },
    {
        "title": "📉 Risk-adjusted Return by Investment",
        "sql_file": "scripts/queries/investment_analysis/risk_adjusted_return.sql",
        "visualize": False
    }
]

# Create a new notebook
nb = nbf.v4.new_notebook()
cells = []

# Add title and database connection
cells.append(nbf.v4.new_markdown_cell("# 💼 Investment Portfolio Analysis"))
cells.append(nbf.v4.new_code_cell("""\
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv("../.env")

user = "root"
password = os.getenv("MYSQL_ROOT_PASSWORD")
host = "localhost"
port = int(os.getenv("MYSQL_PORT"))
database = os.getenv("MYSQL_DATABASE")

engine = create_engine(f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}")
"""))

# Add SQL sections
for item in queries:
    cells.append(nbf.v4.new_markdown_cell(f"## {item['title']}"))
    
    try:
        with open(item["sql_file"], "r", encoding="utf-8") as f:
            sql = f.read().strip()
    except FileNotFoundError:
        print(f"❌ SQL file not found: {item['sql_file']}")
        continue
    
    cells.append(nbf.v4.new_code_cell(f"""\

query = \"\"\"{sql}\"\"\"
df = pd.read_sql(query, engine)
df
"""))

    if item.get("visualize"):
        cells.append(nbf.v4.new_code_cell(item["viz_code"].strip()))

# Save notebook
Path("notebooks").mkdir(exist_ok=True)
nb.cells = cells
with open("notebooks/analysis_investment_portfolio.ipynb", "w", encoding="utf-8") as f:
    nbf.write(nb, f)

print("✅ Notebook created at notebooks/analysis_investment_portfolio.ipynb")
