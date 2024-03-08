USE littlelemondb;
INSERT INTO roles(Name)
VALUES ('Manager'),
       ('Chef'),
       ('Waiter'),
       ('Receptionist');

INSERT INTO staff(firstname, lastname, roleid, salary)
VALUES ('Alice', 'Brown', 1, 5000.00),
       ('Bob', 'Wilson', 2, 4000.00),
       ('Charlie', 'Davis', 3, 3000.00),
       ('Marcos','Joseph',4,2500.00),
       ('Diana', 'Prince', 2, 4200.00),
       ('Clark', 'Kent', 3, 3200.00),
       ('Bruce', 'Wayne', 2, 3800.00),
       ('Barry', 'Allen', 4, 2200.00);


INSERT INTO Bookings (Date, TableNo)
VALUES ('2024-03-08 13:00:00', 5),
       ('2024-03-08 14:00:00', 10),
       ('2024-03-08 15:00:00', 15),
       ('2024-03-08 16:00:00', 11),
       ('2024-03-09 13:00:00', 6),
       ('2024-03-09 14:00:00', 11),
       ('2024-03-09 15:00:00', 16),
       ('2024-03-09 16:00:00', 5),
       ('2024-03-10 13:00:00', 7),
       ('2024-03-10 14:00:00', 12),
       ('2024-03-10 15:00:00', 17),
       ('2024-03-10 16:00:00', 6);


INSERT INTO customers(firstname, lastname, phone, email, bookingid)
VALUES ('John', 'Doe', '1234567890', 'john.doe@example.com',1),
       ('Jane', 'Smith', '2345678901', 'jane.smith@example.com',2),
       ('Emily', 'Jones', '3456789012', 'emily.jones@example.com',3),
       ('Bob','Jones','46789809876','bobjones@email.com',4),
       ('Alice', 'Wonderland', '5556789012', 'alice.w@example.com', 5),
       ('Naruto', 'Uzumaki', '5557890123', 'naruto@example.com', 6),
       ('Son', 'Goku', '5558901234', 'goku@example.com', 7),
       ('Satoru', 'Gojo', '5559012345', 'gojo@example.com', 8),
       ('Yuji', 'Itadori', '5550123456', 'yuji.i@example.com', 9),
       ('John', 'Time', '5551234567', 'jt@example.com', 10),
       ('Victor', 'Curry', '5552345678', 'victor.c@example.com', 11),
       ('William', 'Stone', '5553456789', 'william.s@example.com', 12);

INSERT INTO menuitem(course, starter, dessertname, drink)
VALUES ('Sushi', 'Miso Soup', 'Mochi', 'Sake'),
      ('Tacos', 'Guacamole', 'Churros', 'Margarita'),
      ('Butter Chicken', 'Samosas', 'Gulab Jamun', 'Mango Lassi'),
      ('Beef Bourguignon', 'French Onion Soup', 'Creme Brulee', 'Bordeaux Wine'),
      ('Vegetable Stir Fry', 'Spring Rolls', 'Fried Ice Cream', 'Green Tea'),
      ('BBQ Ribs', 'Cornbread', 'Pecan Pie', 'Bourbon'),
      ('Paella', 'Tapas', 'Flan', 'Sangria');

INSERT INTO menu (menuitemid, name, cuisine)
VALUES (1, 'Sushi Set', 'Japanese'),
      (2, 'Taco Fiesta', 'Mexican'),
      (3, 'Indian Delight', 'Indian'),
      (4, 'French Classic', 'French'),
      (5, 'Asian Fusion', 'Chinese'),
      (6, 'American BBQ', 'American'),
      (7, 'Spanish Experience', 'Spanish');

INSERT INTO status(name)
VALUES ('Delivered'),
       ('Preparing'),
       ('Waiting The Customer');

INSERT INTO deliverystatus (deliverydate, statusid)
VALUES ('2024-03-08 15:00:00', 1),
       ('2024-03-08 16:00:00', 1),
       ('2024-03-08 17:00:00', 2),
       ('2024-03-08 18:00:00', 3);


INSERT INTO orders(date, quantity, totalcost, statusid, menuid, customerid, staffid)
VALUES ('2024-03-08 14:00:00', 2,300.00,1,1,1,1),
       ('2024-03-08 15:00:00', 1,220.00,1,2,2,2),
       ('2024-03-08 16:00:00', 3,95.00,2,3,3,3),
       ('2024-03-08 17:00:00', 2,120.00,3,4,4,4);
