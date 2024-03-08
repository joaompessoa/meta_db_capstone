-- Task 1
START TRANSACTION;

-- I create the BookingID relationship in the Customers table, and not the other way around
INSERT INTO bookings(date,TableNo)
VALUES ('2022-10-10 18:00:00',5),
       ('2022-10-11 18:00:00',3),
       ('2022-10-12 18:00:00',2),
       ('2022-10-13 18:00:00',2);

SELECT * FROM bookings;

INSERT INTO customers(firstname, lastname, phone, email, bookingid)
VALUES  ('Rita','Johnson','40928409','example@email.com',13),
        ('Jorge','Presley','409345409','example@email.com',14),
        ('Breno','Leal','404358409','example@email.com',15),
        ('Luke','Calandrini','40345509','example@email.com',16);

SELECT * FROM customers;

-- Task 2

DELIMITER //
CREATE PROCEDURE CheckBooking(in date_of_booking date, in table_number int)
BEGIN
   DECLARE table_status varchar(40);
   IF (SELECT NOT EXISTS(SELECT DATE(bookings.DATE),bookings.tableno FROM bookings
                         WHERE date(bookings.Date) = date_of_booking AND bookings.TableNo = table_number))
        THEN SET table_status = 'Free';
   ELSE SET table_status = 'Booked';
   END IF;
   SELECT CONCAT('Table ',table_number, ' is ', table_status,' on ', date_of_booking) as 'Booking Status';
END;

DELIMITER ;
-- I didn't copy and paste the data from the Task, so my dates are different, please check before confirming!
CALL CheckBooking('2022-10-11',3);

COMMIT ;

-- Task 3
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN date_booking DATE, IN table_no INT)
BEGIN
    DECLARE booking_status VARCHAR(255);
    IF NOT EXISTS (SELECT 1 FROM bookings WHERE DATE(Date) = date_booking AND TableNo = table_no) THEN

        INSERT INTO bookings (Date, TableNo) VALUES (date_booking, table_no);
        SET booking_status = CONCAT('Table ', table_no, ' is free, booking confirmed');
        COMMIT;
    ELSE
        ROLLBACK;
        SET booking_status = CONCAT('Table ', table_no, ' is already booked, booking canceled');
    END IF;
    SELECT booking_status AS 'Booking Status';
END //

DELIMITER ;

CALL AddValidBooking('2024-03-10',17);

