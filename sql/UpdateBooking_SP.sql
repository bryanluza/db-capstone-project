DELIMITER //
CREATE PROCEDURE UpdateBooking(
	IN booking_id INT,
    IN booking_date DATE 
    )
BEGIN
	UPDATE bookings 
    SET date = booking_date
    WHERE bookingID = booking_id;
    SELECT concat("Booking ", booking_id, " updated.") as Confirmation;
END //
DELIMITER ;