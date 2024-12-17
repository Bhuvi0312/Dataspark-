USE dataspark;
SELECT * from overall;
-- Overall Sales Perfomance
SELECT
      DATE_FORMAT(order_date, '%Y')AS Year,
      SUM(quantity * unit_price_usd)AS TotalSale,
      SUM(quantity)AS TotalQuantity
FROM overall
GROUP BY Year
ORDER BY Year;

-- Sales by Product
SELECT
      product_name,
      SUM(quantity)AS TotalQuantitySold,
      SUM(quantity * unit_price_usd)AS TotalRevenue
FROM overall
GROUP BY product_name
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Sales by Store
SELECT
      country,
      storekey,
      SUM(quantity * unit_price_usd)As StoreTotalSales,
      SUM(quantity)As StoreTotalQuantity
FROM overall
GROUP BY country,storeykey
ORDER BY country,StoreTotalSales DESC;

-- Sales by currency
SELECT
      currency_code,
      SUM(quantity * unit_price_usd)As TotalSalesInOriginalCurrency,
      SUM(quantity * unit_price_usd * exchange)As TotalSalesInUSD,
      SUM(quantity * unit_price_usd * exchange) - SUM(quantity * unit_price_usd)As SalesImpactFromExchangeRate,
      SUM(quantity)As TotalQuantitySold
FROM overall
GROUP BY currency_code
ORDER BY TotalSalesInUSD DESC;