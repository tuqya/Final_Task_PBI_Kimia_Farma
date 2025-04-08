
CREATE TABLE `rakamin-kf-analytics-455516.kimia_farma.base_table` AS
SELECT 
  t.transaction_id,
  t.date,
  t.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  c.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,
  CASE 
    WHEN t.price <= 50000 THEN 0.1
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.2
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.3
  END AS presentase_gross_laba,
  (t.price - (t.price * discount_percentage / 100)) AS nett_sales,
  ((t.price - (t.price * discount_percentage / 100)) * 
    CASE 
      WHEN t.price <= 50000 THEN 0.1
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.2
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.3
    END) AS nett_profit,
  t.rating AS rating_transaksi
FROM 
  `rakamin-kf-analytics-455516.kimia_farma.kf_final_transaction` t
JOIN 
  `rakamin-kf-analytics-455516.kimia_farma.kf_product` p 
  ON t.product_id = p.product_id
JOIN 
  `rakamin-kf-analytics-455516.kimia_farma.kf_kantor_cabang` c 
  ON t.branch_id = c.branch_id
