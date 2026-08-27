-- Display the details of the product where product type is coffee.
SELECT * FROM PRODUCT
WHERE PRODUCT_TYPE='COFFEE'

-- Display the details where total expenses are greater than 40.
SELECT * FROM FACT
WHERE TOTAL_EXPENSES>40

-- Display state in a sequential order in a Location Table.
SELECT DISTINCT(STATE)
FROM LOCATION
ORDER BY STATE

-- Display the date, product ID and sales where total expenses are between 100 to 200.
SELECT DATE,PRODUCTID,SALES
FROM FACT
WHERE TOTAL_EXPENSES BETWEEN 100 AND 200

-- Delete the records in the Product Table for regular type.
DELETE FROM PRODUCT
WHERE TYPE='REGULAR'
