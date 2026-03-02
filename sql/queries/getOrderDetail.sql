/*
# DESC Orders;

SELECT DISTINCT(cust_id) FROM Orders limit 5;  # use the 4th for checking 
SELECT OrderID, Quantity, Cost FROM Orders where cust_id = '00-435-7006';
*/

PREPARE getOrderDetail FROM 
'SELECT OrderID, Quantity, Cost 
 FROM Orders 
 WHERE cust_id = ?';

/*
SET @ID = '00-435-7006';
EXECUTE getOrderDetail USING @ID;
DEALLOCATE PREPARE getOrderDetail;
*/