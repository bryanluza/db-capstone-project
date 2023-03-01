DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
SELECT MAX(quantity) as MaxQuantity FROM orders;
END //
DELIMITER ;