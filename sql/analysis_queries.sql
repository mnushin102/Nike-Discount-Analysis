-- Compare between average of the original prices
-- and the average of discounted prices
SELECT
    AVG(original_price) AS avg_original_price,
    AVG(discounted_price) AS avg_discounted_price
FROM nike_discounts_analysis;

-- Average discount percentage
SELECT AVG(discount_percent) AS avg_discount_price
FROM nike_discounts_analysis;

-- Highest discounted product
SELECT product_name, discounted_price
FROM nike_discounts_analysis
ORDER BY discounted_price DESC
LIMIT 1;

-- Number of products per category
SELECT category, COUNT(*) AS total_products
FROM nike_discounts_analysis
GROUP BY category
ORDER BY total_products DESC;

-- Average discount per category
SELECT category, AVG(discounted_price) AS avg_discount_price
FROM nike_discounts_analysis
GROUP BY category
ORDER BY avg_discount_price DESC;

-- Query a category that give the highest discounts
SELECT category, MAX(discounted_price) AS highest_discount_price
FROM nike_discounts_analysis
GROUP BY category
ORDER BY highest_discount_price DESC
LIMIT 1;

-- List top 10 highest-rated discounted products
SELECT product_name, discounted_price, rating
FROM nike_discounts_analysis
ORDER BY rating DESC
LIMIT 10;

-- Determine if higher discounts hurt ratings
SELECT
    CASE 
        WHEN discount_percent < 20 THEN 'Low Discount'
        WHEN discount_percent BETWEEN 20 AND 40 THEN 'Medium Discount'
        ELSE 'High Discount'
        END AS discount_group, AVG(rating) as avg_rating
FROM nike_discounts_analysis
GROUP BY discount_group;

-- Altered the table by adding
-- estimated_units sold column to the table
ALTER TABLE nike_discounts_analysis
    ADD COLUMN estimated_units_sold INT;

-- Assigned random values between 20 and 320 to estimated_units_sold column
UPDATE nike_discounts_analysis
SET estimated_units_sold = FLOOR(random() * 300 + 20);

-- Estimated revenue per product
SELECT product_name, discounted_price,
       estimated_units_sold, discounted_price * estimated_units_sold AS est_revenue
FROM nike_discounts_analysis
ORDER BY est_revenue DESC;

-- Estimated total revenue by category (excluding nulls)
SELECT category, SUM(discounted_price * estimated_units_sold) AS total_revenue
FROM nike_discounts_analysis
GROUP BY category
HAVING SUM(discounted_price * estimated_units_sold) IS NOT NULL
ORDER BY total_revenue DESC;