-- Task 1
CREATE VIEW OrdersView AS
    SELECT orders.orderid,orders.quantity,orders.totalcost
    FROM orders
    WHERE orders.quantity > 2;

-- Task 2

CREATE VIEW OrdersLargerThan200 AS
    SELECT customers.CustomerID,
           CONCAT(customers.FirstName, ' ', customers.LastName) AS 'Full Name',
           orders.OrderID,
           orders.TotalCost AS Cost,
           menu.Name AS 'Menu Name',
           menuitem.Course
    FROM orders
    INNER JOIN customers ON orders.CustomerID = customers.customerid
    INNER JOIN menu ON orders.MenuID = menu.MenuID
    INNER JOIN menuitem ON menu.MenuItemID = menuitem.MenuItemID
    WHERE orders.TotalCost > 200;

-- Task 3

CREATE VIEW OrderedTwiceOrMore AS
    SELECT menu.Name
    FROM menuitem
    INNER JOIN menu ON menu.MenuItemID = menuitem.MenuItemID
    WHERE menu.MenuID = ANY (
        SELECT orders.Quantity
        FROM orders
        WHERE orders.Quantity >= 2
    );



