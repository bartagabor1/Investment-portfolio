  # 💼 Investment Portfolio Analysis

  This project analyzes and visualizes data from an investment portfolio management system using **MySQL**, **Python**, **Jupyter Notebook**, and **Power BI**. It demonstrates data engineering, SQL analytics, data visualization, and business intelligence skills.

  ---

  ## 🗂️ Project Structure

  ```
  investment_portfolio/
  ├── docker/
  │   ├── docker-compose.yml
  │   ├── init.sql
  │   ├── .env
  ├── scripts/
  │   ├── create_db.sql
  │   ├── insert_sample_data.sql
  │   └── queries/
  │       ├── client_insights/
  │       │   ├── top_fee_payers.sql
  │       │   └── client_owned_value_summary.sql
  │       ├── portfolio_analysis/
  │       │   ├── portfolio_weighted_return.sql
  │       │   ├── portfolio_risk_vs_client_risk.sql
  │       │   ├── most_diversified_portfolios.sql
  │       │   └── top_portfolios_by_annual_return.sql
  │       ├── investment_analysis/
  │       │   └── risk_adjusted_return.sql
  │       ├── dashboards/
  │       │   ├── asset_allocation_breakdown.sql
  │       │   └── monthly_transaction_trend.sql
  │       └── advanced/
  │           ├── moving_avg_returns.sql
  │           ├── client_rank_by_ownership.sql
  │           ├── last3_transactions_per_investment.sql
  │           └── portfolio_vs_market_benchmark.sql
  ├── tables/
  │   ├── client_portfolios.sql
  │   ├── clients.sql
  │   ├── investments.sql
  │   ├── portfolio_investments.sql
  │   ├── portfolios.sql
  │   ├── returns.sql
  │   └── transactions.sql
  ├── notebooks/
  │   └── analysis_investment_portfolio.ipynb
  ├── powerbi/
  │   ├── investment_portfolio_dashboard.pbix
  │   └── benchmark_snapshot.jpeg
  ├── docs/
  │   └── index.html
  ├── requirements.txt
  ├── README.md
  └── .gitignore
  ```

  ---

  ## 🚀 Getting Started

 ### 1. Clone the repository

```bash
  git clone https://github.com/bartagabor1/Investment-portfolio.git
  cd Investment-portfolio
```
  
  2. **Start MySQL via Docker**

  ```bash
  cd docker
  docker-compose up -d
  ```

  3. **Load schema & data**

  The `init.sql` file automatically sets up schema and inserts sample data when the container starts.

  4. **Open Jupyter Notebook**

  Run exploratory analysis in:

  ```
  notebooks/analysis_investment_portfolio.ipynb
  ```

  5. **Open Power BI Dashboard**

  Explore KPIs and charts in:

  ```
  powerbi/investment_portfolio_dashboard.pbix
  ```

  ---

  ## 📊 Power BI Dashboards

  ### 🔑 KPI Highlights

  - **Total AUM (Assets Under Management):** Total value of all portfolios combined.
  - **Average Annual Return:** Mean annual return across all portfolios and investments.
  - **Top Portfolio Return:** Highest-performing portfolio based on annual return.
  - **Risk-Adjusted Return:** Return adjusted for volatility, offering a more balanced performance view.

  ### 📈 Dashboard Visualizations

  | Step | Visualization                    | SQL File                              | Chart Type               |
  |------|----------------------------------|----------------------------------------|--------------------------|
  | 1    | Portfolio vs. Market Benchmark   | `portfolio_vs_market_benchmark.sql`   | Clustered Column Chart   |
  | 2    | Moving Average Return            | `moving_avg_returns.sql`              | Line Chart               |
  | 3    | Asset Allocation Breakdown       | `asset_allocation_breakdown.sql`      | Donut Chart              |
  | 4    | Risk‑Adjusted Returns            | `risk_adjusted_return.sql`            | Bar Chart                |
  | 5    | Monthly Transaction Trend        | `monthly_transaction_trend.sql`       | Stacked Column Chart     |
  | 6    | Top Clients by Fees              | `top_fee_payers.sql`                  | Bar Chart                |

  🖼️ Preview available in [`powerbi/benchmark_snapshot.jpg`](powerbi/benchmark_snapshot.jpg)

  ---

  ## 📚 Documentation

  - [`docs/index.html`](docs/index.html): A self-contained HTML documentation page detailing the project overview, folder structure, setup, and Power BI insights.
  - [`powerbi/benchmark_snapshot.jpg`](powerbi/benchmark_snapshot.jpg): A PDF snapshot of the dashboard with KPIs and key charts.
  - [`reports/benchmark_report.pdf`](reports/benchmark_report.pdf): The final written investment portfolio report as a PDF.
  ---

  ## ⚙️ Requirements

  - Python 3.8+
  - Docker & Docker Compose
  - Jupyter Notebook
  - Python packages: `pandas`, `sqlalchemy`, `python-dotenv`, `mysql-connector-python`, `matplotlib`, `nbformat`, `seaborn`, `jupyter`

  Install dependencies with:

  ```bash
  pip install -r requirements.txt
  ```

  ---

  ## 📝 License

  For educational purposes. Please retain attribution when reusing.

  ---

  ## 📬 Contact

  Feel free to open issues or submit pull requests. Questions welcome via GitHub Issues.

## ✅ Author
Created by Gabor Barta

### 💼 Fiverr profile: fiverr.com/gaborbarta1

### 📬 Contact: barta.gabor1992@email.com
