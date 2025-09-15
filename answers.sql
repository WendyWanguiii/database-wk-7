SELECT 
    OrderID,
    CustomerName,
    TRIM(Product) AS Product
FROM
    ProductDetail,
    JSON_TABLE(
        CONCAT('["', REPLACE(Products, ',', '","'), '"]'),
        '$[*]' COLUMNS(Product VARCHAR(100) PATH '$')
    ) AS jt
ORDER BY OrderID, Product;





-- Orders table: CustomerName depends only on OrderID
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- OrderLineItems table: full dependency on OrderID + Product composite key
SELECT OrderID, Product, Quantity
FROM OrderDetails;
