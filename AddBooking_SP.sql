DELIMITER //
CREATE PROCEDURE AddBooking(
	IN booking_id INT,
    IN customer_id INT,
    IN table_number INT,
    IN booking_date DATE 
    )
BEGIN
	INSERT INTO bookings (bookingID, customerID, date, time, tableNo, employeeID) VALUES (booking_id, customer_id, booking_date, '00:00:00', table_number, 1);
    SELECT concat("New booking added") as Confirmation;
END //
DELIMITER ;