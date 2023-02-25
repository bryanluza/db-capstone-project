DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE booking_id INT DEFAULT 0;
    SELECT bookingID INTO booking_id FROM bookings WHERE date = booking_date and tableNo = table_number;
    START TRANSACTION;
	INSERT INTO bookings (date, time, tableNo, employeeID, customerID) VALUES (booking_date, '00:00:00', table_number, 1,1);
    IF booking_id = 0 THEN 
		SELECT concat("Booking for table ", table_number, " for ", booking_date, " has been added.") as BookingStatus;
        COMMIT;
    ELSE 
		SELECT concat("Table ", table_number, " unavailable on ", booking_date, " - Booking cancelled.") as BookingStatus;
		ROLLBACK;
    END IF;

END //
DELIMITER ;