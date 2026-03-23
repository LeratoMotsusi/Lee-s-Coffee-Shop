--This is just to check that the table is loaded correctly and I am able to read it properly
SELECT * 
FROM `brightcoffeeshop`.`default`.`bcshop` 
LIMIT 100;

--They started collecting the data  on 2023-01-01
SELECT MIN(transaction_date) AS Minimum_start_date
FROM `brightcoffeeshop`.`default`.`bcshop` ; 


--We have 3 store locations
SELECT DISTINCT store_location
FROM `brightcoffeeshop`.`default`.`bcshop`; 

SELECT product_detail
FROM `brightcoffeeshop`.`default`.`bcshop`; 
