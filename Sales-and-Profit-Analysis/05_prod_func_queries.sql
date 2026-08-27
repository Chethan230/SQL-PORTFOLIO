-- Create a stored procedure to fetch the result according to the product type from Product Table.
CREATE PROCEDURE GET_PRODUCT_BY_TYPE @PRODUCT_TYPE VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM PRODUCT
    WHERE PRODUCT_TYPE = @PRODUCT_TYPE
END

dbo.get_product_by_type 'coffee'

-- Create a user-defined function for the product table to fetch a particular product type based upon the user's preference.
CREATE FUNCTION PRODUCT_FUNC (@PRODUCT_TYPE VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM PRODUCT
    WHERE PRODUCT_TYPE = @PRODUCT_TYPE
)

SELECT * FROM
PRODUCT_FUNC ('COFFEE')
