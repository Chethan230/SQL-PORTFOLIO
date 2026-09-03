CREATE DATABASE ZOMATO

USE ZOMATO

SELECT * FROM ZOMATO

-- 1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

CREATE FUNCTION StuffChicken (@RestaurantType VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    IF @RestaurantType = 'Quick Bites'
        RETURN 'Quick Chicken Bites'

    RETURN @RestaurantType
END

SELECT RestaurantType,
       dbo.StuffChicken(RestaurantType) AS NewRestaurantType
FROM Zomato

-- 2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

SELECT RestaurantName,
       CuisinesType,
       dbo.StuffChicken(RestaurantType) AS RestaurantType
FROM Zomato
WHERE [No_of_Rating] = (
    SELECT MAX([No_of_Rating])
    FROM Zomato
)

-- 3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, 
-- ‘Good’ if it has above 3.5 and below 4 star rating, 
-- ‘Average’ if it is above 3 and below 3.5 and 
-- ‘Bad’ if it is below 3 star rating.

SELECT RATING,
    CASE
        WHEN RATING>4 THEN 'EXCELLENT'
        WHEN RATING>3.5 AND RATING<=4 THEN 'GOOD'
        WHEN RATING>3 AND RATING<=3.5 THEN 'AVERAGE'
        WHEN RATING<3 THEN 'BAD'
    END AS STATUS
FROM ZOMATO

-- 4. Find the Ceil, floor and absolute values of the rating column and display the current date
-- and separately display the year, month_name and day.

SELECT CEILING(RATING) AS CEIL_VAL,
       FLOOR(RATING) AS FLOOR_VAL,
       ABS(RATING) AS ABS_VAL,
       GETDATE() AS DATE,
       YEAR(GETDATE()) AS YYYY,
       DATENAME(MONTH,GETDATE()) AS MONTH,
       DATENAME(DW,GETDATE()) AS DAY
FROM ZOMATO

-- 5. Display the restaurant type and total average cost using rollup.

SELECT RestaurantType,
       SUM(AverageCost) AS TotalAverageCost
FROM Zomato
GROUP BY ROLLUP(RestaurantType)

-- 6. Create a stored procedure to display the restaurant name, type and cuisine where the
-- table booking is not zero.

CREATE PROCEDURE GetTableBookingRestaurants
AS
BEGIN
    SELECT RestaurantName,
           RestaurantType,
           CuisinesType
    FROM Zomato
    WHERE TableBooking = 'Yes'
END

EXEC GetTableBookingRestaurants

-- 7. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
-- and rollback it.

BEGIN TRANSACTION

UPDATE ZOMATO
SET CuisinesType='Cafeteria'
WHERE CuisinesType='Cafe'

SELECT * FROM Zomato
WHERE CuisinesType='Cafeteria'

ROLLBACK TRANSACTION

SELECT * FROM Zomato
WHERE CuisinesType='Cafe'

-- 8. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

SELECT TOP 5
       ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNumber,
       Area,
       RestaurantName,
       Rating
FROM Zomato
ORDER BY Rating DESC

-- 9. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.

CREATE VIEW TopRating
AS
SELECT TOP 5
       RestaurantName,
       RestaurantType,
       CuisinesType,
       Area,
       Rating
FROM Zomato
ORDER BY Rating DESC

SELECT * FROM TopRating

-- 10. Create a trigger that give an message whenever a new record is inserted.

CREATE TRIGGER trg_AfterInsert
ON Zomato
AFTER INSERT
AS
BEGIN
    PRINT 'New restaurant record has been inserted successfully.'
END

INSERT INTO Zomato
VALUES( 7200,'Test Restaurant','Quick Bites',4.5,100,500,1,0,'Cafe','Bangalore','MG Road',30)

-- 11. Use the while loop to display the 1 to 50.

DECLARE @i INT = 1
WHILE @i <= 50
BEGIN
    PRINT @i
    SET @i = @i + 1
END
