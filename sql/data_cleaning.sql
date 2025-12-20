-- List products and categories
-- with no original and discounted prices
SELECT product_name, category
FROM nike_discounts_analysis
WHERE original_price IS NULL OR discounted_price IS NULL;

-- Find invalid discounts
SELECT product_name, discounted_price, original_price
FROM nike_discounts_analysis
WHERE discounted_price > original_price;

-- Remove duplicate product names
DELETE FROM nike_discounts a
    USING nike_discounts b
WHERE a.ctid > b.ctid
  AND a.product_name = b.product_name;