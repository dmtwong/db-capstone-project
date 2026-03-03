/*
DESC Orders;
SELECT DISTINCT(OrderID) from orders limit 5; # 4th for check: '36-917-2834'
SELECT DISTINCT(order_id_pk) from orders limit 5; # 4th for check: '133'
*/
drop procedure if exists CancelOrder;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN this_orderID VARCHAR(11))
BEGIN
	SET SQL_SAFE_UPDATES = 0; # temp disable in this session 
	START TRANSACTION;
    IF (SELECT EXISTS(SELECT 1 FROM Orders WHERE OrderID = this_orderID)) THEN        
        DELETE FROM Orders WHERE OrderID = this_orderID;
        COMMIT;
        SELECT CONCAT("Order ", this_orderID, " is cancelled") AS Confirmation;        
    ELSE
        ROLLBACK; # Nothing to revert in this case but self note only
        SELECT CONCAT("Order ", this_orderID, " does not exist") AS Confirmation;
	SET SQL_SAFE_UPDATES = 1; # enable again
    END IF;
END //
DELIMITER ;

/*
# SELECT 1 FROM Orders WHERE OrderID = '11-835-2932';
# SELECT EXISTS(SELECT 1 FROM Orders WHERE OrderID = '11-835-2932') AS COUNT;
SELECT EXISTS(SELECT 1 FROM Orders WHERE OrderID = 'ORD-999') AS COUNT;

INSERT INTO Orders (
    OrderID, OrderDate, Quantity, Cost, 
    Sales, Discount, DeliveryCost, City, 
    Country, PostalCode, CountryCode, cust_id, 
    menu_id
) 
VALUES (
    'ORD-999', '2024-05-20', 5, 250.00, 
    300.00,     10.00,     5.00,     'Toronto', 
    'Canada',     'A1B 2C3',    'CA',     '00-435-7006',  # an existing cust_id
    1              # same for menu
);

call CancelOrder('ORD-999'); # Confirmed by rerun it again, different message with no error
*/


 