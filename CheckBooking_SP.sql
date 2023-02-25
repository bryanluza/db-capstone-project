DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	SELECT
		CASE
			WHEN EXISTS (SELECT tableNo FROM bookings WHERE date = booking_date and tableNo = table_number) 
				THEN concat("Table ", table_number, " is already booked.") 
			ELSE concat("Table ", table_number, " is available.") 
		END as 'Booking status';
END //
DELIMITER ;