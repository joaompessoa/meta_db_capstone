-- Task 1
DELIMITER //
CREATE PROCEDURE AddBooking(in date_booking datetime,in table_no int)
BEGIN
    INSERT INTO bookings(date,tableno)
    VALUES (date_booking,table_no);
    SET @last_booking_id = LAST_INSERT_ID();
    INSERT INTO customers(FirstName,lastname,phone, email,bookingid)
    VALUES('Bob','Silva','0980980','email@example.com',@last_booking_id);
    SELECT 'New Booking Added' AS Confirmation;
END //

DELIMITER ;

CALL AddBooking('2024-10-30 18:00:00',12);

-- Task 2
DELIMITER //
CREATE PROCEDURE UpdateBooking(in booking_id int,in date_booking datetime)
BEGIN
    IF EXISTS(SELECT bookings.BookingID from bookings WHERE BookingID = booking_id) THEN
        UPDATE bookings SET date = date_booking WHERE BookingID = booking_id;
        SELECT CONCAT('Booking: ', booking_id, ' Was updated') As Confirmation;
    ELSE
        SELECT 'Booking doesnt exists' AS Warning;
    END IF;
END //
DELIMITER ;

CALL UpdateBooking(19,'2024-12-30 18:00:00');

CALL UpdateBooking(20,'2024-12-30 18:00:00');

-- Task 3

DELIMITER //
CREATE PROCEDURE DeleteBooking(in booking_id int)
BEGIN
    IF EXISTS(SELECT bookings.BookingID from bookings WHERE BookingID = booking_id) THEN
        DELETE FROM bookings WHERE BookingID = booking_id;
        SELECT CONCAT('Booking: ', booking_id, ' Was Removed') As Confirmation;
    ELSE
        SELECT 'Booking doesnt exists' AS Warning;
    END IF;
END //
DELIMITER ;

CALL DeleteBooking(19);



