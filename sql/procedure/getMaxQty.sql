USE littlelemonproject;
describe orders;

DELIMITER //

CREATE PROCEDURE getMaxQty()
BEGIN
    SELECT MAX(Quantity) AS "Largest Quantity in Orders"
    FROM Orders;
END //

DELIMITER ;