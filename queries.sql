--- NUMBER OF EMPLOYEE HOURS WORKED PER STORE ---
-- SELECT s.store_id, SUM(EXTRACT(EPOCH FROM (t.end_time - t.start_time) / 3600)) AS total_hours 
-- FROM timesheet t
-- JOIN stores s ON t.store_id = s.store_id
-- GROUP BY s.store_id
-- ORDER BY s.store_id;


--- NUMBER OF PURCHASES PER STORE ---
-- SELECT stores.store_id, COUNT(sales.sales_id ) AS total_purchases
-- FROM stores
-- LEFT JOIN sales ON stores.store_id = sales.store_id
-- GROUP BY stores.store_id;

--- PROFIT PER STORE ---
-- SELECT store_id, SUM(sales_price) 
-- FROM sales
-- GROUP BY store_id;