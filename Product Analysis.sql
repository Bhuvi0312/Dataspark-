USE dataspark;
SELECT * FROM overall;
-- Product Popularity
SELECT
      product_name,
      brand,
      SUM(quantity)AS TotalQuantitySold,
      SUM(quantity * unit_price_usd)AS TotalRevenue
FROM overall
GROUP BY product_name,brand
ORDER BY TotalQuantitySold DESC;

-- Profitability Analysis
SELECT
      Product_name,
      brand,
      category,
      subcatogery,
      SUM(quantity * unit_price_usd)AS TotalRevenue,
      SUM(quantity * unit_cost_usd)AS TotalCost,
      (SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd))AS TotalProfit,
      ((SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd)) / NULLIF(SUM(quantity * unit_price_usd),0)) * 100 AS profitMargitPercentage 
FROM overall
GROUP BY product_name,brand,category,subcategory
ORDER BY ProfitMarginPercentage DESC;

-- Category Analysis
SELECT
      category,
      subcategory,
      SUM(quantity)AS TotalQuantitySold,
      SUM(quantity * unit_price_usd)AS TotalRevenue,
      AVG(unit_price_usd)AS Unitprice,
      COUNT(DISTINCT productkey)AS NumberOfProducts
FROM overall
GROUP BY category,subcategory
ORDER BY TotalRevenue DESC;
      