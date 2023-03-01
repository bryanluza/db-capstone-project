PREPARE GetOrderDetail FROM 
	'SELECT orders.orderID OrderID, orders.quantity as Quantity, orders.total as Cost
	from orders
	where orders.customerID = ?';