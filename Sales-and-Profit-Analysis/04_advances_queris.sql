-- Display the rank without any gap to show the sales wise rank.
SELECT SALES,
    DENSE_RANK() OVER(ORDER BY SALES DESC)
FROM FACT
  
-- If there is an increase in sales of 5%, calculate the increased sales.
SELECT SALES,SALES+(SALES*0.05) AS INC_SALE
FROM FACT
  
-- Write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss.
SELECT *,
CASE WHEN TOTAL_EXPENSES<60 THEN 'PROFIT'
ELSE 'LOSS'
END AS STATUS 
FROM FACT
  
-- Give the total weekly sales value with the date and product ID details. Use roll-up to pull the data in hierarchical order.
SELECT DATEPART(WEEK, DATE) AS WEEKNUMBER,PRODUCTID,SUM(SALES) AS TOTAL_WEEKLY_SALES
FROM FACT
GROUP BY ROLLUP(DATEPART(WEEK, DATE), PRODUCTID)

-- Apply union and intersection operator on the tables which consist of attribute area code.
SELECT AREA_CODE FROM FACT
UNION
SELECT AREA_CODE FROM LOCATION

SELECT AREA_CODE FROM FACT
INTERSECT
SELECT AREA_CODE FROM LOCATION
  
-- Change the product type from coffee to tea where productID is 1 and undo it.
BEGIN TRANSACTION
UPDATE PRODUCT
SET PRODUCT_TYPE='TEA'
WHERE PRODUCT_TYPE='COFFEE'
AND PRODUCTID=1
SELECT * FROM PRODUCT
ROLLBACK TRANSACTION
  
-- Display the ASCII value of the fifth character from the column Product.
SELECT PRODUCT,ASCII(SUBSTRING(PRODUCT, 5, 1)) AS ASCII_VALUE
FROM PRODUCT
