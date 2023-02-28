DELIMITER //
CREATE PROCEDURE CancelBooking(
	IN booking_id INT
    )
BEGIN
	DELETE FROM bookings WHERE bookingID = booking_id;
    SELECT concat("Booking ", booking_id, " cancelled.") as Confirmation;
END //
DELIMITER ;