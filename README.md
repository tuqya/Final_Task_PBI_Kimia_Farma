# Final Task - Kimia Farma Dataset

This repository contains SQL queries used to create and analyze transaction data from the Kimia Farma dataset. The main focus is on creating a `base_table` as the foundation for performance analysis of sales, products, and branches.

## 📁 Files
- `create_base_table.sql`: contains SQL query to create the `base_table` by joining key source tables.

## 🧾 Query Explanation

- Create `base_table` in the `kimia_farma` dataset:
```sql
CREATE TABLE `rakamin-kf-analytics-455516.kimia_farma.base_table` AS
SELECT ...
```

- The table includes:
  - `transaction_id`, `date`, `branch_id`, `customer_name`, `product_id` from transaction table.
  - `branch_name`, `city (kota)`, `province (provinsi)`, `branch_rating` from branch table.
  - `product_name` from the product table.
  - `actual_price`, `discount_percentage` from transaction details.

- Additional calculations:
  - `gross_profit_percentage`: based on product price range.
  - `nett_sales`: price after discount.
  - `nett_profit`: calculated by multiplying nett sales with the gross margin percentage.
  - `transaction_rating`: user rating for each transaction.

## 🛠 Tools
- Google BigQuery (for SQL queries and data warehouse)
- GitHub (for version control)
- Looker Studio (for dashboard visualization)

## 📌 Purpose
- To create a summarized dataset ready for performance analysis based on:
  - Branch
  - Product
  - Discount and profitability

## 👤 Author
- Name: Tuqya Risang Ayu Utami
- Project: Final Task Rakamin Academy - Kimia Farma Big Data Analytics Project Based Internship Program
