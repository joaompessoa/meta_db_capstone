-- Task 1
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT max(orders.quantity) AS 'Max Quantity In Orders'
    FROM orders;
END //
DELIMITER ;

CALL GetMaxQuantity();

-- Task 2

PREPARE GetOrderDetail FROM 'SELECT orders.OrderID,orders.Quantity,orders.TotalCost
                        FROM orders
                        WHERE CustomerID = (?)';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3

DELIMITER //
CREATE PROCEDURE CancelOrder(in userinput int,out confirmation varchar(100))
BEGIN
    IF (SELECT EXISTS (SELECT OrderID FROM orders WHERE OrderID = userinput)) THEN
        DELETE FROM orders WHERE orders.OrderID = userinput;
        SET confirmation = CONCAT('Order ', userinput, 'was canceled');
    ELSE SET confirmation = CONCAT('Order ', userinput, 'doesnt exist');
    END IF;
    SELECT confirmation as 'Confirmation Message';
END //

DELIMITER ;


CALL CancelOrder(4,@confirmation);


