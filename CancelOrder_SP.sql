DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
	DELETE FROM orders WHERE orderID = id;
    SELECT concat('Order ', id, ' was cancelled') AS Confirmation;
END //
DELIMITER ;