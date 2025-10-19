# 🧠 StratifyAI – Signal Extraction Automation Workflow

## 📘 Overview  
The **StratifyAI Automation Workflow** is an AI-powered system that merges **real-time stock market data** and **financial news** to generate, validate, and explain trading signals.  
Developed using **Snowflake** and **n8n**, it automates the end-to-end process — from ingestion and sentiment analysis to backtesting and visualization — within a **production-ready and scalable architecture**.

---

## ⚙️ System Components  

### 🧩 1. Snowflake  
Snowflake acts as the **central data warehouse and analytics layer** for structured and unstructured data.

#### **Key Functions**
- Store raw and processed stock and news data  
- Perform NLP and sentiment analysis using **Snowflake Cortex**  
- Execute feature generation and backtesting using **Snowpark**  
- Maintain explainable, auditable, and scalable data workflows  

#### **Access Instructions**
```bash
Login URL: fqagalo-de75672.snowflakecomputing.com/console/login
User ID: SaurabhK
Password: Everydaywakeupat@550
```

#### **Database Information**
| Property | Value |
|-----------|--------|
| **Database Name** | `STRATIFYAIDB` |
| **Schema** | `PUBLIC` |

#### **Table Overview**
| Table Name | Purpose |
|-------------|----------|
| `STOCK_PRICES_RAW` | Stores raw JSON API responses from Alpha Vantage |
| `STOCK_PRICES` | Structured and cleaned stock market data |
| `STOCK_META` | Metadata for refresh intervals and API configuration |
| `NEWS_ARTICLES` | News article metadata, summary, and sentiment score |
| `NEWS_TICKER_SENTIMENT` | Mapping of news articles to stock tickers with relevance and sentiment |
| `NEWS_TOPICS` | Topic extraction results for each article |
| `STOCK_FEATURES` | Engineered features like returns, volatility, and volume |
| `SENTIMENT_FEATURES` | Aggregated sentiment and news count by symbol and interval |
| `FEATURES_PER_INTERVAL` | Combined stock + sentiment features for signal generation |
| `BACKTEST_RESULTS` | Simulated trading results including signals, PnL, and positions |

---

### ⚙️ 2. n8n Workflow  
n8n automates the orchestration of the end-to-end data pipeline — from fetching APIs to running Snowflake queries.

#### **Key Responsibilities**
- **Ingestion:** Calls APIs (Alpha Vantage & News) and pushes responses into Snowflake tables.  
- **Transformation:** Executes SQL and Snowpark scripts for feature creation.  
- **Backtesting:** Triggers Snowflake procedures for simulation and PnL calculation.  
- **Automation:** Handles scheduling, retries, and data monitoring seamlessly.  

#### **Access Instructions**
```bash
Login URL: https://app.n8n.cloud/login
Account Name: h2s-hackthon
Email: sourabhkure8@gmail.com
Password: Scram@411
```

---

## 🔄 End-to-End Workflow  
1. **Data Ingestion:** n8n fetches stock and news data and loads them into Snowflake.  
2. **Sentiment Analysis:** Snowflake Cortex performs NLP and sentiment scoring.  
3. **Feature Engineering:** Snowpark computes returns, volatility, and sentiment interactions.  
4. **Signal Generation & Backtesting:** Simulates trading strategies and evaluates performance.  
5. **Explainability:** Links signals to originating events (articles or data patterns).  
6. **Visualization:** Dashboards built from Snowflake datasets for trend and PnL monitoring.

---

## 🧠 Architecture Summary  
**Data Flow:**  
`Alpha Vantage / News APIs → n8n Workflow → Snowflake (Cortex + Snowpark) → Backtesting Engine → Explainability Dashboard`

---

## ✅ Prototype Highlights  
- Automated ingestion and processing using **n8n**  
- Unified handling of **structured + unstructured** data in **Snowflake**  
- NLP and sentiment extraction powered by **Cortex**  
- Feature engineering and backtesting with **Snowpark**  
- End-to-end explainability and audit trail  
- **Production-ready and scalable** by design  

---

## 📄 Author  
**StratifyAI Hackathon Prototype**  
Created by: *Saurabh K*
