-- Create a table named nike_discounts_analysis
CREATE TABLE nike_discounts_analysis
(
    product_name     TEXT,
    category         TEXT,
    original_price   DECIMAL(10, 2),
    discounted_price DECIMAL(10, 2),
    discount_percent DECIMAL(5, 2),
    rating           DECIMAL(3, 2),
    review_count     INT
);