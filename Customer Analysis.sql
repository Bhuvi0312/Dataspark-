USE dataspark;
SELECT * from overall;
SELECT
	  gender,
      CASE
          WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 13 AND 17 THEN '13-17'
          WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 18 AND 25 THEN '18-25'
          WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 26 AND 35 THEN '26-35'
		  WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 36 AND 45 THEN '36-45'
		  WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 46 AND 55 THEN '46-55'
		  WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 56 and 65 then '56-65'
		  WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >=66 THEN '66+'
          ELSE 'Unknown'
	   END AS AgeGroup,
       city,
       state_x,
       country_x,
       continent,
       COUNT(DISTINCT customerkey)AS CustomerCount,
       AVG(quantity * unit_price_usd)AS AverageOrderValue,
       COUNT(order_number)AS PurchanseFrequency,
       MAX(product_name)AS PrefferedProduct
       FROM overall
       GROUP BY gender,AgeGroup,city,state_x,country_x,continent
       ORDER BY AgeGroup;